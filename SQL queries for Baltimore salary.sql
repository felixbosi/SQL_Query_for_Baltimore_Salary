--Let us bring in our data.

Select * 
from [baltimore salary A];

--How to pull a given number of row from the database. For example first 20 rows; 

Select  top 20 *
from [baltimore salary A];

--syntax to get the unique values in columns 'Job_Class' and 'Agency_Name'.

Select Distinct  Agency_Name
from [baltimore salary A];

Select Distinct  Job_Class
from [baltimore salary A];


--Data Filtering.
--how to fetch information about a given referenced column or columns

Select *
from [baltimore salary A]
where Job_Class = 'UTILITIES INST REPAIR II'

Select *
from [baltimore salary A]
where Job_Class = 'UTILITIES INST REPAIR II'
and Fiscal_Year = 'FY2021';

Select *
from [baltimore salary A]
where Job_Class = 'UTILITIES INST REPAIR II'
and Fiscal_Year = 'FY2021'
or Agency_ID = 'A99' ;

--Let's arrange the data . we can use the order by clause.
--order by Object_ID

Select *
from [baltimore salary A]
where Job_Class = 'POLICE OFFICER'
and Fiscal_Year = 'FY2021'
or Agency_ID = 'A99'
order by Object_ID;

--Let's arrange the data . we can use the order by clause.
--Order by Hire_Date. 

Select *
from dbo.[baltimore salary A]
where Job_Class = 'POLICE OFFICER'
and Fiscal_Year = 'FY2021'
or Agency_ID = 'A99'
order by Hire_Date ;

--Let's arrange the data in a descending ,or ascending order . we can use the order by clause.

Select *
from dbo.[baltimore salary A]
where Job_Class = 'POLICE OFFICER'
and Fiscal_Year = 'FY2021'
or Agency_ID = 'A99'
order by Hire_Date  desc;

Select *
from dbo.[baltimore salary A]
where Job_Class = 'POLICE OFFICER'
and Fiscal_Year = 'FY2021'
or Agency_ID = 'A99'
order by Hire_Date  asc;
 
 --We can play around the names, by aliasing them.
Select Job_Class as Career
from dbo.[baltimore salary A] as DB1        

--let's add $ to columns Annual_salary and Gross_Pay.
UPDATE [baltimore Salary A]             
SET [Gross_Pay] = '$' + [Gross_Pay];

UPDATE [baltimore salary A]
SET [Annual_Salary] = CONCAT('$', [Annual_Salary]);

--Aggregating some columns

Select job_Class, Agency_Name,
AVG(Gross_Pay) as Avg_Gross_pay,
AVG(Annual_Salary) as Avg_Annual_Salary,
SUM(Gross_Pay) as Sum_Gross_Pay,
SUM(Annual_Salary) as Sum_Annual_Pay,
count(Gross_Pay) as Count_of_Gross_Pay,
count(Annual_Salary )as Count_of_Annual_Salary
from dbo.[baltimore salary A] as DB1        
where Fiscal_Year = 'FY2021'
group by Job_Class, Agency_Name
order by Agency_Name;

--Advanced Filtering. The percentage symbol grabs everything after IT
Select * 
from [baltimore salary A] 
where Job_Class like 'IT%';

Select * 
from [baltimore salary A] 
where Annual_Salary between 80000 and 145000
order by 1, 7;

--Let us solve some real life problems with the dataset.
--Pulling out a specific data about a particular individual.

--Let's fetch an individual with a given Object_ID.

Select * 
from [baltimore salary A] 
where OBJECT_ID = 9;

-- Get information on employer with a given name.

Select * 
from [baltimore salary A] 
where Last_Name = 'Matthew' 
and Middle_Initial = 'T'
and First_Name = 'Kenneth';

--check the list of job classes are in the dataset.

Select  distinct Job_Class 
from [baltimore salary A];

--check the total amount of unique job classes in the dataset.

SELECT COUNT(DISTINCT Job_Class) AS unique_Job_Class
FROM [baltimore salary A] ;

--check the total  of the distinct job classes in the dataset.
--It shows the total of each job class in an ascending order.

SELECT Job_Class, COUNT(*) AS count_of_different_types_of_Job_Class
FROM [baltimore salary A]
GROUP BY Job_Class 
ORDER BY count_of_different_types_of_Job_Class asc;

--It shows the total of each job class in an descending order.

SELECT Job_Class, COUNT(*) AS count_of_different_types_of_Job_Class
FROM [baltimore salary A]
GROUP BY Job_Class 
ORDER BY count_of_different_types_of_Job_Class desc;

--check the total amount of unique Agency_Name in the dataset.

SELECT COUNT(DISTINCT Agency_Name) AS unique_Agency_Name
FROM [baltimore salary A] ;

--check the total  of the distinct Agency Name in the dataset.
--It shows the total of each Agency Name in an ascending order.

SELECT Agency_Name, COUNT(*) AS count_of_different_Names_of_Agencies
FROM [baltimore salary A]
GROUP BY Agency_Name 
ORDER BY count_of_different_Names_of_Agencies asc;

--It shows the total of each Agency Name in an descending order.

SELECT Agency_Name, COUNT(*) AS count_of_different_Names_of_Agencies
FROM [baltimore salary A]
GROUP BY Agency_Name 
ORDER BY count_of_different_Names_of_Agencies desc;

--Let us get the top 20 earners in baltimore.

SELECT  top 20 Object_ID, Last_Name, Middle_Initial, First_Name, Job_Class, Agency_Name, Annual_Salary
FROM [baltimore salary A]
ORDER BY Annual_Salary desc;

--Let us get the lowest 20 earners in baltimore.

SELECT  top 20 Object_ID, Last_Name, Middle_Initial, First_Name, Job_Class, Agency_Name, Annual_Salary
FROM [baltimore salary A]
ORDER BY Annual_Salary asc;


--Let us get the oldest 20 staff in baltimore.

SELECT  top 20 Object_ID, Last_Name, Middle_Initial, First_Name, Job_Class, Agency_Name, Annual_Salary,Hire_Date
FROM [baltimore salary A]
ORDER BY Hire_Date asc;

--Let us get the youngest 20 staff in baltimore.

SELECT  top 20 Object_ID, Last_Name, Middle_Initial, First_Name, Job_Class, Agency_Name, Annual_Salary,Hire_Date
FROM [baltimore salary A]
ORDER BY Hire_Date desc;
