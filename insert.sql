--Insert Statement

--Country insert
INSERT INTO tbl_MstCountry (
RegionalCode, 
CountryCode, 
CountryName) 
VALUES
('AS', 'IN', 'India'),
('NA', 'US', 'United States'),
('EU', 'DE', 'Germany'),
('EU', 'FR', 'France'),
('AS', 'CN', 'China'),
('SA', 'BR', 'Brazil'),
('OC', 'AU', 'Australia'),
('NA', 'CA', 'Canada'),
('AS', 'JP', 'Japan'),
('EU', 'GB', 'United Kingdom'),
('AF', 'ZA', 'South Africa');  

--City insert
--Seven city: India, America, China, UK, Japan, Australia, and Brazil.
INSERT INTO tbl_MstCity (CountryCode, CityCode, City) VALUES
('IN', 'MUM', 'Mumbai'),
('IN', 'DEL', 'Delhi'),
('IN', 'BLR', 'Bengaluru'),
('IN', 'HYD', 'Hyderabad'),
('IN', 'CHN', 'Chennai'),
('IN', 'KOL', 'Kolkata'),
('IN', 'PUN', 'Pune'),
('IN', 'AHD', 'Ahmedabad'),
('IN', 'LKO', 'Lucknow'),
('IN', 'JAIP', 'Jaipur'),
('US', 'NYC', 'New York City'),
('US', 'LAX', 'Los Angeles'),
('US', 'CHI', 'Chicago'),
('US', 'HOU', 'Houston'),
('US', 'PHX', 'Phoenix'),
('CN', 'BJS', 'Beijing'),
('CN', 'SHA', 'Shanghai'),
('CN', 'GZ', 'Guangzhou'),
('JP', 'TYO', 'Tokyo'),
('JP', 'OSA', 'Osaka'),
('AU', 'SYD', 'Sydney'),
('AU', 'MEL', 'Melbourne'),
('BR', 'SAO', 'São Paulo'),
('BR', 'RIO', 'Rio de Janeiro');


--CompanyType
INSERT INTO tbl_MstCompanyType (CompanyType) VALUES
('Software Company'),
('Manufacturing Company'),
('Pharmaceutical Company'),
('Financial Services Company'),
('Retail Company'),
('Construction Company'),
('Healthcare Company'),
('Automobile Company'),
('Telecommunication Company'),
('Energy and Utilities Company'),
('Media and Entertainment Company'),
('E-commerce Company'),
('Food and Beverage Company'),
('Aerospace and Defense Company'),
('Textile Company'),
('Education and Training Company'),
('Consulting Company'),
('Real Estate Company'),
('Hospitality Company'),
('Logistics and Transportation Company');


INSERT INTO tbl_MstRole ([Role]) VALUES
('Super Admin'),
('Admin'),
('Manager'),
('Team Lead'),
('Developer'),
('QA Tester'),
('Support Staff'),
('HR'),
('Finance Manager'),
('Sales Executive'),
('Customer Support'),
('Marketing Manager'),
('Business Analyst'),
('IT Security'),
('System Administrator'),
('Healthcare Staff');

INSERT INTO tbl_MstUserStatus ([Status]) VALUES
('Active'),
('Inactive'),
('Suspended'),
('Pending Verification'),
('Banned'),
('Deleted'),
('Locked'),
('Awaiting Approval');


INSERT INTO tbl_MstCompanyDetails (
    CompanyName,
    CompanyType, -- Foreign Key from tbl_MstCompanyType
    CompanyAddress,
    CityCode, -- Foreign Key from tbl_MstCity
    CountryCode, -- Foreign Key from tbl_MstCountry
    Phone,
    Emailid,
    Website,
    HowComeToKnow,
    [Status], -- Foreign Key from tbl_MstUserStatus
    CreatedDateTime
) VALUES
('Tech Solutions Pvt Ltd', 1, 'IT Park, Bengaluru', 'BLR', 'IN', '9876543210', 'info@techsolutions.com', 'www.techsolutions.com', 'Online Advertisement',  1, GETDATE()),
('ABC Manufacturing Ltd', 2, 'Industrial Area, Mumbai', 'MUM', 'IN', '9988776655', 'contact@abcmanufacturing.com', 'www.abcmanufacturing.com', 'Reference',  1, GETDATE()),
('MediCare Pharma', 3, 'Medical Hub, Hyderabad', 'HYD', 'IN', '9123456789', 'support@medicarepharma.com', 'www.medicarepharma.com', 'Conference',  1, GETDATE()),
('FinTrust Services', 4, 'Corporate Plaza, Delhi', 'DEL', 'IN', '9867543210', 'info@fintrust.com', 'www.fintrust.com', 'Email Campaign',  1, GETDATE()),
('Retail Hub Pvt Ltd', 5, 'Mall Street, Chennai', 'CHN', 'IN', '9212345678', 'hello@retailhub.com', 'www.retailhub.com', 'Social Media',  1, GETDATE()),
('GreenCon Constructions', 6, 'Builder Street, Kolkata', 'KOL', 'IN', '9321654789', 'contact@greencon.com', 'www.greencon.com', 'Business Expo',  1, GETDATE()),
('CareWell Hospitals', 7, 'Healthcare Avenue, Pune', 'PUN', 'IN', '9456781234', 'info@carewellhospitals.com', 'www.carewellhospitals.com', 'Referral',  1, GETDATE()),
('SpeedAuto Motors', 8, 'Car Street, Ahmedabad', 'AHD', 'IN', '9876512345', 'sales@speedauto.com', 'www.speedauto.com', 'Online Search',  1, GETDATE()),
('Global Telecom Ltd', 9, 'Tower Park, Jaipur', 'JAIP', 'IN', '9988771122', 'support@globaltelecom.com', 'www.globaltelecom.com', 'Newspaper',  1, GETDATE()),
('EcoPower Energy', 10, 'Energy Road, Lucknow', 'LKO', 'IN', '9234567890', 'contact@ecopower.com', 'www.ecopower.com', 'Industry Event',  1, GETDATE());


INSERT INTO tbl_MstUserDetails (
    Companyid,  -- Foreign Key from tbl_MstCompanyDetails
    LoginId,
    [Password],
    [Name],
    Phone,
    Emailid,
    [Role],  -- Foreign Key from tbl_MstRole
    [Status],  -- Foreign Key from tbl_MstUserStatus
    CreatedDateTime
) VALUES
(1, 'admin_tech', 'Pass@123', 'Rahul Sharma', '9876543210', 'rahul.sharma@techsolutions.com', 1, 1, GETDATE()),
(4, 'support_fin', 'Support@789', 'Ravi Kumar', '9867543210', 'ravi.kumar@fintrust.com', 11, 3, GETDATE()),
(3, 'sales_medi', 'Sales@456', 'Anil Kapoor', '9123456789', 'anil.kapoor@medicarepharma.com', 10, 2, GETDATE()),
(2, 'manager_abc', 'Manager@123', 'Priya Desai', '9988776655', 'priya.desai@abcmanufacturing.com', 3, 1, GETDATE()),
(6, 'it_greencon', 'IT@234', 'Vikram Malhotra', '9321654789', 'vikram.malhotra@greencon.com', 15, 1, GETDATE()),
(7, 'doctor_carewell', 'Doctor@567', 'Dr. Meera Joshi', '9456781234', 'meera.joshi@carewellhospitals.com', 16, 4, GETDATE()),
(10, 'energy_eco', 'Eco@Energy', 'Amitabh Rao', '9234567890', 'amitabh.rao@ecopower.com', 13, 8, GETDATE()),
(8, 'auto_speed', 'Speed@Auto', 'Rajesh Patil', '9876512345', 'rajesh.patil@speedauto.com', 5, 5, GETDATE()),
(9, 'telecom_global', 'Telecom@111', 'Simran Kaur', '9988771122', 'simran.kaur@globaltelecom.com', 12, 7, GETDATE()),
(5, 'lead_retail', 'Lead@123', 'Sunita Verma', '9212345678', 'sunita.verma@retailhub.com', 4, 1, GETDATE());


INSERT INTO tbl_MstCompanyStatus (Status)
VALUES 
('New'),
('Old'),
('Pending Approval'),
('Verified'),
('Suspended'),
('Closed');
