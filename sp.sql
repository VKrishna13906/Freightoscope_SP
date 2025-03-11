--use Training
--go
/*  
sp_FillDropDown 'country'  
sp_FillDropDown 'city'  
sp_FillDropDown 'companyType'  
sp_FillDropDown 'company'  
sp_FillDropDown 'user'  
sp_FillDropDown  
*/  
alter proc sp_FillDropDown  
@flag varchar(100) = ''  
as  
begin  
 if(@flag = 'country')  
 begin  
  select   
  RegionalCode,  
  CountryCode,   
  CountryName  
  from   
  tbl_MstCountry  
 end  
 else if(@flag = 'city')  
 begin  
  select   
  CountryCode,  
  CityCode,  
  City  
  from   
  tbl_MstCity  
 end  
 else if(@flag = 'companyType')  
 begin  
  select  
  Id,  
  CompanyType  
  from   
  tbl_MstCompanyType  
 end  
 else if(@flag = 'company')  
 begin  
  select   
  cd.Id as CompanyID,  
  cd.CompanyName as [Name],  
  cd.CompanyAddress as [Address],  
  cd.CityCode as [City],  
  cd.CountryCode as [Country],  
  cd.Phone,  
  cd.Emailid as EmailId,  
  cd.Website,  
  cd.HowComeToKnow,  
  cd.Others,  
  cs.[Status],  
  cd.CreatedDateTime,  
  cd.Modified  
  from   
  tbl_MstCompanyDetails cd   
  left join tbl_MstCompanyStatus cs on cd.[Status] = cs.id  
  select  
  Id,  
  CompanyType  
  from   
  tbl_MstCompanyType  
 end  
 else if(@flag = 'user')  
 begin  
  select   
  ud.id as UserID,  
  ud.Companyid,  
  ud.LoginID,  
  ud.[Password],  
  ud.[Name],  
  ud.Phone,  
  ud.EmailId,  
  rl.[Role],  
  us.[Status],  
  ud.CreatedDateTime as [Created],  
  ud.Modified,  
  ud.Accessed  
  from   
  tbl_MstUserDetails ud  
  left join tbl_MstRole rl on rl.Id = ud.[Role]  
  left join tbl_MstUserStatus us on ud.[Status] = us.Id  
 end  
 else  
 begin  
  --Table 1:Country  
  select   
  RegionalCode,  
  CountryCode,   
  CountryName  
  from   
  tbl_MstCountry  
  
  --Table 2:CompanyDetails  
  select   
  cd.Id as CompanyID,  
  cd.CompanyName as [Name],  
  cd.CompanyAddress as [Address],  
  cd.CityCode as [City],  
  cd.CountryCode as [Country],  
  cd.Phone,  
  cd.Emailid as EmailId,  
  cd.Website,  
  cd.HowComeToKnow,  
  cd.Others,  
  cs.[Status],  
  cd.CreatedDateTime,  
  cd.Modified  
  from   
  tbl_MstCompanyDetails cd   
  left join tbl_MstCompanyStatus cs on cd.[Status] = cs.id  
  
  --Table 3:CompanyType  
  select  
  Id,  
  CompanyType  
  from   
  tbl_MstCompanyType  
  
  --Table 4:User details  
  select   
  ud.id as UserID,  
  ud.Companyid,  
  ud.LoginID,  
  ud.[Password],  
  ud.[Name],  
  ud.Phone,  
  ud.EmailId,  
  rl.[Role],  
  us.[Status],  
  ud.CreatedDateTime as [Created],  
  ud.Modified,  
  ud.Accessed  
  from   
  tbl_MstUserDetails ud  
  left join tbl_MstRole rl on rl.Id = ud.[Role]  
  left join tbl_MstUserStatus us on ud.[Status] = us.Id  
 end  
end  