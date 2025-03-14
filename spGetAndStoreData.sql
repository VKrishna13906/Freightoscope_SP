--[spGetAndStoreData] '1,2'
ALTER PROCEDURE [dbo].[spGetAndStoreData] -- '1,2'
    @Userid NVARCHAR(100) = ''
AS
BEGIN
    SET NOCOUNT ON;

    -- Create a temporary table
    CREATE TABLE #tempTable (
        Companyid VARCHAR(100),
        UserID INT,
        UserName VARCHAR(100),
        EmailID VARCHAR(100)
    );

    -- Construct the Dynamic SQL Query
    DECLARE @Sql NVARCHAR(MAX);

    SET @Sql = N'
    INSERT INTO #tempTable (Companyid, UserId, UserName, EmailID)
    SELECT Companyid, id, [Name], Emailid 
    FROM tbl_MstUserDetails 
    WHERE id IN (SELECT Item FROM dbo.SplitString(@InputUserid, '',''))';

    -- Execute the dynamic SQL with a parameter
    EXEC sp_executesql @Sql, N'@InputUserid NVARCHAR(100)', @Userid;

    -- Check if data is inserted
    IF NOT EXISTS (SELECT 1 FROM #tempTable)
    BEGIN
        SELECT 'Wrong User ID passed' AS [Message], 400 AS Id;
        DROP TABLE #tempTable;
        RETURN;
    END

    -- Fetch Company Details
    SELECT 
		a.Id as CompanyId,
        a.CompanyName, 
        c.CountryName as Country, 
        d.City, 
        'Success' AS [Message], 
        200 AS Id
    FROM tbl_MstCompanyDetails a
    INNER JOIN #tempTable b ON b.Companyid = a.Id
    INNER JOIN tbl_MstCountry c ON c.CountryCode = a.CountryCode
    INNER JOIN tbl_MstCity d ON d.CityCode = a.CityCode;

    -- Return the temporary table data
    SELECT * FROM #tempTable;

    -- Cleanup
    DROP TABLE #tempTable;
END;
