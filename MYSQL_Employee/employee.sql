create table employee(empid int primary key,empname varchar(100), department varchar(50),contactno bigint, emaildid varchar(100), empheadid int);

create table empdept(deptid varchar(50) primary key,deptname varchar(100), dept_off varchar(100), depthead int ,foreign key(depthead) references employee(empid));
create table empsalary(empid int ,foreign key(empid) references employee(empid), salary bigint, ispermanent varchar(3)); 
create table project(projectid varchar(50) primary key, duration int);
create table country(cid varchar(50) primary key, cname varchar(100)); 
create table clienttable(clientid varchar(50) primary key, clientname varchar(100), cid varchar(50) references country(cid)); 
create table empproject(empid int,foreign key(empid) references employee(empid), projectid varchar(50),foreign key(projectid) references project(projectid), clientid varchar(50),foreign key(clientid) references clienttable(clientid),startyear int, endyear int); 

select * from employee;
 
INSERT INTO employee (empid, empname, department, contactno, emaildid, empheadid) VALUES (101, 'Ankita Panjwani', 'E-101', '1234567890', 'ankita@test.com', 105);
INSERT INTO employee (empid, empname, department, contactno, emaildid, empheadid) VALUES (102, 'Priya', 'E-104', '1234567890', 'priya@yahoo.com', 103);

INSERT INTO empdept (deptid, deptname, dept_off, depthead) VALUES ('E-101','HR','Monday', 105);
INSERT INTO empdept (deptid, deptname, dept_off, depthead) VALUES ('E-104','Development ','Tuesday ', 102);

INSERT INTO empsalary (empid, salary, ispermanent) VALUES (101,2000,'yes');
INSERT INTO empsalary (empid, salary, ispermanent) VALUES (102,10000,'yes');
INSERT INTO empsalary (empid, salary, ispermanent) VALUES (103,20000,'no');
INSERT INTO empsalary (empid, salary, ispermanent) VALUES (104,1900,'yes');

INSERT INTO project (projectid, duration) VALUES ('p-1',23);
INSERT INTO project (projectid, duration) VALUES ('p-2',15);
INSERT INTO project (projectid, duration) VALUES ('p-3',25);
INSERT INTO project (projectid, duration) VALUES ('p-4',2);
INSERT INTO project (projectid, duration) VALUES ('p-5',30);

INSERT INTO country (cid, cname) VALUES ('c-1','India');
INSERT INTO country (cid, cname) VALUES ('c-2','USA');
INSERT INTO country (cid, cname) VALUES ('c-3','China');
INSERT INTO country (cid, cname) VALUES ('c-4','Pakistan');
INSERT INTO country (cid, cname) VALUES ('c-5','Russia');


INSERT INTO clienttable (clientid, clientname, cid) VALUES ('cl-1','ABC Group','c-1');
INSERT INTO clienttable (clientid, clientname, cid) VALUES ('cl-2','PQR Industries','c-1');
INSERT INTO clienttable (clientid, clientname, cid) VALUES ('cl-3','XYZ Pvt Ltd','c-2');
INSERT INTO clienttable (clientid, clientname, cid) VALUES ('cl-4','Alt technologies','c-3');
INSERT INTO clienttable (clientid, clientname, cid) VALUES ('cl-5','MNP Tech','c-5');


INSERT INTO empproject (empid, projectid, clientid,startyear,endyear) VALUES (101,'p-1','Cl-1',2010,2010);
INSERT INTO empproject (empid, projectid, clientid,startyear,endyear) VALUES (102,'p-2','Cl-2',2011,2013);
INSERT INTO empproject (empid, projectid, clientid,startyear,endyear) VALUES (103,'p-1','Cl-3', 2014,NULL);
INSERT INTO empproject (empid, projectid, clientid,startyear,endyear) VALUES (104,'p-4','Cl-1',2015,2015);
INSERT INTO empproject (empid, projectid, clientid,startyear,endyear) VALUES (105,'p-4','Cl-5',2018,NULL);

/*QUERIES */

select *
from employee
where empname LIKE 'P%';

select * from empsalary where salary>5000 AND ispermanent = 'yes';


select *
from employee
where emaildid LIKE '%test.com%';

select * from employee where department='E-104' OR department='E-102';


select  deptname from empdept where deptid='E-102';

select SUM(salary) TotalSalary from empsalary where ispermanent = 'yes';

select *
from employee
where empname LIKE '%a';

select count(*) as total_employee,empdept.deptname
from employee 
inner join empdept on employee.department = empdept.deptid
group by empdept.deptname;


select * from empproject where startyear=2010;

select * from empproject where startyear = endyear;

select empname
from employee
where empname LIKE '__h%';


