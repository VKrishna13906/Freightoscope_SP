create table tbl_MstCountry
(
	RegionalCode varchar(10),
	CountryCode varchar(10) primary key,
	CountryName varchar(100)
)

create table tbl_MstCity
(
	CityCode varchar(10) primary key,
	City varchar(100),
	CountryCode varchar(10),
	Foreign key (CountryCode) references tbl_MstCountry(CountryCode)
)

create table tbl_MstCompanyType
(
	Id int primary key identity(1,1),
	CompanyType varchar(500)
)

create table tbl_MstRole
(
	Id int primary key identity(1,1),
	[Role] varchar(100)
)

CREATE TABLE tbl_MstUserStatus (
    Id int primary key identity(1,1),
    [Status] varchar(100)
);

create table tbl_MstCompanyDetails
(
	Id int primary key identity(1,1),
	CompanyName varchar(500),
	CompanyType int, --Foreign key of tbl_MstCompanyType
	CompanyAddress varchar(max),
	CityCode varchar(10), --Foreign key of tbl_MstCity
	CountryCode varchar(10), --Foreign key of tbl_MstCountry
	Phone varchar(20),
	Emailid varchar(100),
	Website varchar(100),
	HowComeToKnow varchar(100),
	Others varchar(100),
	[Status] varchar(100),
	CreatedDateTime datetime,
	Modified datetime,
	Foreign key (CompanyType) references tbl_MstCompanyType(Id),
	Foreign key (CityCode) references tbl_MstCity(CityCode),
	Foreign key (CountryCode) references tbl_MstCountry(CountryCode)
)

create table tbl_MstUserDetails
(
	id int primary key identity(1,1),
	Companyid int, --Foreign key of tbl_MstCompanyDetails
	LoginId varchar(100),
	[Password] varchar(100),
	[Name] varchar(100),
	Phone varchar(20),
	Emailid varchar(100),
	[Role] varchar(100),
	[Status] varchar(100),
	CreatedDateTime datetime,
	Modified datetime,
	Accessed datetime,
	Foreign key (Companyid) references tbl_MstCompanyDetails(Id)
)

CREATE TABLE tbl_MstCompanyStatus (
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Status] VARCHAR(100)
);
