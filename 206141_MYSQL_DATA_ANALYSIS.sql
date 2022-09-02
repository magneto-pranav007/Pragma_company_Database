create database Pragma_company;
use Pragma_company;

show tables;

select * from employee_info;
alter table employee_info
add primary key(EmployeeNumber);
desc employee_info;
create table Work_ex as
select e.EmployeeNumber,e.TotalWorkingYears,e.NumCompaniesWorked,e.YearsAtCompany from employee_info e
,employee_info e1 where e.EmployeeNumber=e1.EmployeeNumber order by EmployeeNumber asc;
select * from Work_ex;


select * from employee_designation;
desc employee_designation;
create table Portfolio as
select e.EmployeeNumber,e.YearsAtCompany,ed.Department,ed.JobRole,ed.JobLevel,ed.MonthlyIncome
from employee_info e inner join employee_designation ed on
e.EmployeeNumber=ed.EmployeeNumber;
select * from Portfolio;
 

select * from employee_travelling_expenditure;
desc employee_travelling_expenditure;
/*alter table employee_travelling_expenditure
modify column DailyRate int after EmployeeNumber;*/

select * from employee_personal_hr;
desc employee_personal_hr;
#EVALUATION OF MAX RATINGS
select max(EnvironmentSatisfaction),max(JobInvolvement),max(PerformanceRating) from employee_personal_hr;

#EVALUATION OF AVG RATINGS
select avg(EnvironmentSatisfaction),avg(JobInvolvement),avg(PerformanceRating) from employee_personal_hr;

select EmployeeNumber,EnvironmentSatisfaction from employee_personal_hr order by EnvironmentSatisfaction desc;
select EmployeeNumber,JobInvolvement from employee_personal_hr order by JobInvolvement desc;
select EmployeeNumber,PerformanceRating from employee_personal_hr order by PerformanceRating desc;

#EVALUATION OF RATINGS CATEGORICALLY
select EnvironmentSatisfaction,count(EnvironmentSatisfaction) from employee_personal_hr group by EnvironmentSatisfaction order by EnvironmentSatisfaction desc;
select JobInvolvement,count(JobInvolvement) from employee_personal_hr group by JobInvolvement order by JobInvolvement desc;
select PerformanceRating,count(PerformanceRating) from employee_personal_hr group by PerformanceRating order by PerformanceRating desc;

