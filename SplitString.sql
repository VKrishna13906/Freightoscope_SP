
CREATE FUNCTION dbo.SplitString
(
    @InputString NVARCHAR(MAX),
    @Delimiter CHAR(1)
)
RETURNS @OutputTable TABLE (Item NVARCHAR(MAX))
AS
BEGIN
    DECLARE @Start INT, @End INT
    SET @Start = 1

    WHILE CHARINDEX(@Delimiter, @InputString, @Start) > 0
    BEGIN
        SET @End = CHARINDEX(@Delimiter, @InputString, @Start)
        INSERT INTO @OutputTable (Item)
        VALUES (SUBSTRING(@InputString, @Start, @End - @Start))
        SET @Start = @End + 1
    END

    INSERT INTO @OutputTable (Item)
    VALUES (SUBSTRING(@InputString, @Start, LEN(@InputString) - @Start + 1))

    RETURN
END