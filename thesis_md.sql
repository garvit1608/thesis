#Total Working employees
select count(*) from test.hr_data
where DeptID=3 and YEAR(STR_TO_DATE(DateofHire, '%m/%d/%Y')) < '2019' and (YEAR(STR_TO_DATE(DateofTermination, '%m/%d/%Y')) > '2019'or EmploymentStatus='Active');

#Total Active employees
select count(*)
from test.hr_data_md
where Sex='M ' and (YEAR(STR_TO_DATE(DateofTermination, '%m/%d/%Y')) = '2018' or EmploymentStatus='Active');

#Resign
select * from test.hr_data_md
where Sex = 'M ' and YEAR(STR_TO_DATE(DateofTermination, '%m/%d/%Y')) = '2018' and (EmpSatisfaction <=3 or TermReason in ('Another position', 'career change', 'hours', 'maternity leave - did not return', 'medical issues', 'more money', 'relocation out of area', 'return to school','unhappy'));

#Layoff
select count(*) from test.hr_data_md
where Sex='F' and YEAR(STR_TO_DATE(DateofTermination, '%m/%d/%Y')) = '2018' and PerfScoreID <=2;

#Retiring
select * from test.hr_data_md
where Sex = "M " and YEAR(STR_TO_DATE(DateofTermination, '%m/%d/%Y')) = '2018' and TermReason = 'retiring';

#Promotion
select * from test.hr_data_md
where Sex="M " and YEAR(STR_TO_DATE(DateofTermination, '%m/%d/%Y')) = '2018' and PerfScoreID > 3;

#Promotion for Active Employees
select count(*) from test.hr_data_md
where Sex="M " and EmploymentStatus='Active' and PerfScoreID > 3;

#Active Employees
select count(*) from test.hr_data_md
where Age>60 and EmploymentStatus = 'Active';

#Dept
select distinct Department
from test.hr_data;


Select STR_TO_DATE(DateofTermination, '%m/%d/%Y') from test.hr_data_md
where STR_TO_DATE(DateofTermination, '%m/%d/%Y') = '2018-01-01';

Select * from test.hr_data_md
where DateofTermination = '01/01/18' and EmpSatisfaction = 2;

-- SET SQL_SAFE_UPDATES = 0;

-- BEGIN;
-- UPDATE test.hr_data_md SET EmploymentStatus='Voluntarily Terminated'
-- where DateofTermination = '01/01/18' and EmploymentStatus='Active' and EmpSatisfaction = 2;
-- commit;


