/* 1st section Queries  */


/* create table queries */
create table student(admno int primary key, name varchar(100), class varchar(50),sec varchar(50), rno int , address varchar(100),phone int);

create table sports(admno int, foreign key(admno) references student(admno), game varchar(100), coachname varchar(100), grade varchar(100));


/* Insert Queries for student table*/
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (1271, 'Utkarsh Madaan', '12', 'C', 1,'C-32 Punjabi Bhagh',4356154);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (1324, 'Naresh Sharma', '10', 'A', 1,'31 Mohan Nagar',435654);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (1325, 'Md.Yusuf', '10', 'A', 2,'12/21,Chand Nagar',145654);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (1328, 'Submedha', '10', 'B', 23,'59,Moti Nagar',4135654);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (1364, 'Subhya Akhtar', '11', 'B', 13,'12,Janki Puri',NULL);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (1434, 'Varuna', '12', 'B', 21,'69, Rohini',NULL);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (1461, 'David DSouza', '11', 'B', 1,'D-34, Model Town',24322);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (2324, 'Satinder Singh', '12', 'C', 1,'1/2 Gulmohar Park',143654);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (2328, 'Peter Jones', '10', 'A', 18,'21/32B, Vishal Enclave',24356154);
INSERT INTO student (admno, name, class, sec, rno, address, phone) VALUES (2371, 'Mohini Mehta', '11', 'C', 12,'37, Raja Garden',435344);


/* Insert Queries for sports table  */

INSERT INTO sports (admno, game, coachname, grade) VALUES (1324, 'Cricket','Narendra','A');
INSERT INTO sports (admno, game, coachname, grade) VALUES (1364, 'Volleball','M.P. Singh','A');
INSERT INTO sports (admno, game, coachname, grade) VALUES (1271, 'Volleball','M.P. Singh','B');
INSERT INTO sports (admno, game, coachname, grade) VALUES (1434, 'Basket Ball','I. Malhotra','B');
INSERT INTO sports (admno,  game, coachname, grade) VALUES (1461, 'Cricket','Narendra','B');
INSERT INTO sports (admno, game, coachname, grade) VALUES (2328, 'Basket Ball','I. Malhotra','A');
INSERT INTO sports (admno, game, coachname, grade) VALUES (2371, 'Basket Ball','I. Malhotra','A');
INSERT INTO sports (admno, game, coachname, grade) VALUES (1271 , 'Basket Ball','I. Malhotra','A');
INSERT INTO sports (admno, game, coachname, grade) VALUES (1434, 'Cricket','Narendra','A');
INSERT INTO sports (admno, game, coachname, grade) VALUES (2328 , 'Cricket','Narendra','B');
INSERT INTO sports (admno, game, coachname, grade) VALUES (1364  , 'Basket Ball','I. Malhotra','B');



/*SQL Queries*/

/* Q1. Display the lowest and the highest classes from the table STUDENTS. */
select MIN(class) as lowest_class, MAX(class) as highest_class from student;

/* Q.2 Display the number of students in each class from the table STUDENTS. */ 
select COUNT(admno) as Number_of_Students, class as Name_of_Class from student group by class;

/*Q3. Display the number of students in class 10  */ 
select COUNT(admno) as Number_of_Students_of_Class_10th from student where class='10';

/* Q4. Display details of the students of Cricket team */
select * from student 
inner join sports on student.admno = sports.admno
where game='Cricket';

-- OR ---
select student.* from student,sports where student.admno=sports.admno and game='Cricket';

/* Q5. Display the Admission number, name, class, section, and roll number of the students whose grade in the Sports table is ‘A’. */
select * from student 
inner join sports on student.admno = sports.admno
where grade='A';

-- OR--
 select student.admno,name,class,sec,rno from student,sports where student.admno=sports.admno and grade='A';

/* Q6.  Display the name and phone number of the students of class 12 who are playing some game. */
select name,phone,game from student
right join sports on student.admno = sports.admno
where class='12' and game is not null;

/*Q7. Display the number of students with each coach. */
select count(admno) as Number_of_students, coachname as Coach from sports
 group by coachname;


/*Q8. Display the names and phone numbers of the students whose grade is ‘A’ and whose coach is Narendra. */
select name, phone from student 
inner join sports on student.admno = sports.admno
where grade='A' AND coachname='Narendra';

/* Q9 . Identify the Foreign Keys (if any) of these tables. Justify your choices */
		SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA IS NOT NULL AND TABLE_SCHEMA ="students";

/* Q10
i.) SELECT class, sec, count(*) FROM students GROUP BY class, sec; */

	 SELECT class, sec, count(*) FROM student GROUP BY class, sec; 
     
-- ii)  
 SELECT Game, COUNT(*) FROM Sports GROUP BY Game;
-- iii) --
 SELECT game, name, address FROM student, Sports WHERE student.admno =sports.admno AND grade = 'A';
 -- iv) --
 SELECT Game FROM student, Sports WHERE student.admno = sports.admno AND
Student.AdmNo = 1434;


/*  2nd Section Queries */

/*Create table Queries */

create table items(i_code int primary key,name varchar(100), category varchar(100),rate int);
create table bills(billno int,date date, i_code int, foreign key(i_code) references items(i_code),qty int);


/* Insert Queries */
INSERT INTO items (i_code, name, category, rate) VALUES (1001, 'Masala Dosa', 'South Indian', 60); 
INSERT INTO items (i_code, name, category, rate) VALUES (1002, 'Vada Sambhar', 'South Indian', 40);
INSERT INTO items (i_code, name, category, rate) VALUES (1003, 'Idli Sambhar', 'South Indian', 40);
INSERT INTO items (i_code, name, category, rate) VALUES (2001, 'Chow Mein', 'Chineese', 80); 
INSERT INTO items (i_code, name, category, rate) VALUES (2002, 'Dimsum', 'Chineese', 60); 
INSERT INTO items (i_code, name, category, rate) VALUES (2003, 'Soup', 'Chineese', 50); 
INSERT INTO items (i_code, name, category, rate) VALUES (3001, 'Pizza', 'Italian', 240); 
INSERT INTO items (i_code, name, category, rate) VALUES (3002, 'Pasta', 'Italian', 125);



/* insert queries into bills table */
INSERT INTO bills (billno, date, i_code, qty) VALUES (1, '2010-04-01', 1002, 2); 
INSERT INTO bills (billno, date, i_code, qty) VALUES (1, '2010-04-01', 3001, 1);
INSERT INTO bills (billno, date, i_code, qty) VALUES (2, '2010-04-01', 1001, 3);
INSERT INTO bills (billno, date, i_code, qty) VALUES (2, '2010-04-01', 1002, 1);
INSERT INTO bills (billno, date, i_code, qty) VALUES (2, '2010-04-01', 2003, 2);
INSERT INTO bills (billno, date, i_code, qty) VALUES (3, '2010-04-02', 2002, 1);
INSERT INTO bills (billno, date, i_code, qty) VALUES (4, '2010-04-02', 2002, 4);
INSERT INTO bills (billno, date, i_code, qty) VALUES (4, '2010-04-02', 2003, 2);
INSERT INTO bills (billno, date, i_code, qty) VALUES (5, '2010-04-03', 2003, 2);
INSERT INTO bills (billno, date, i_code, qty) VALUES (5, '2010-04-03', 3001, 1);
INSERT INTO bills (billno, date, i_code, qty) VALUES (5, '2010-04-03', 3002, 3);



-- Queries of bills and items tables--
-- Q11. Display the average rate of a South Indian item--
select avg(rate) as Average_Rate from items where category='South Indian';

-- Q12. Display the number of items in each category --
select category as Categories,count(i_code) as number_of_items from items group by category;

-- Q13. Display the total quantity sold for each item --
select name as Item_name,SUM(qty) as Total_Quanity_sold  from items right join bills on items.i_code = bills.i_code group by name  ;
 

 -- Q14. Display total quantity of each item sold but don’t display this data for the items whose total quantity sold is less than 3. --
  select i_code, sum(qty) from bills group by i_code  having sum(qty)>3;


-- Q15. Display the details of bill records along with the Name of each corresponding item.--
select items.name 'Item Name',bills.billno 'Bill no', bills.date 'Bill Date', bills.i_code 'Bill code', bills.qty 'Bill QTY' from items right join bills on items.i_code = bills.i_code;

/*optional soln*/
select billno,date, bills.I_code,name,qty from items,bills where items.i_code=bills.i_code;

-- Q16. Display the details of the bill records for which the item is ‘Dosa’. --
select * from bills left join items on bills.i_code = items.i_code where name='Masala Dosa';

/*optional*/
select items.name 'Item Name',billno,date,bills.i_code,qty from items,bills where items.i_code = bills.i_code and name like '%Dosa';


--  Q17. Display the bill records for each Italian item sold.  --
select * from bills left join items on bills.i_code = items.i_code where category='Italian';
-- OR --
select items.name 'Item name', items.category 'Category' ,bills.billno 'Bill no', bills.date 'Bill Date', bills.i_code 'Bill code', bills.qty 'Bill QTY'
from items,bills where items.i_code = bills.i_code AND  items.category='Italian';



--    Q18. Display the total value of items sold for each bill--
select bills.billno 'Bill no', items.name 'item Name', sum(bills.qty) 'Sum of Quantity', items.rate 'Rate', sum(bills.qty) * (items.rate) 'Total Sell' from items,bills where items.i_code = bills.i_code group by items.name; 
  -- OR --
  select billno,sum(qty) 'total item sold' from bills group by billno;




/*  3rd section Queries */
create table vehicle(RegNo  char(10)  primary key NOT NULL, RegDate date , Owner  varchar(30),Address varchar(50));
create table offence(  Offence_Code   int(3)  primary key NOT NULL, Off_desc varchar(30),  Challan_Amt  int(4));
create table chalaan( Challan_No int(11) primary key NOT NULL,ch_date  date , RegNo char(10), foreign key(RegNo) references vehicle(RegNo),Offence int(3), foreign key(Offence) references offence(Offence_Code));

/* Insert Queries */

INSERT INTO vehicle (RegNo, RegDate, Owner, Address) VALUES (1, '2010-04-01', 'rajpal', 'manipal'); 
INSERT INTO vehicle (RegNo, RegDate, Owner, Address) VALUES (2, '2011-12-15', 'saurav', 'manali'); 
INSERT INTO vehicle (RegNo, RegDate, Owner, Address) VALUES (3, '2012-10-10', 'pavan', 'baroda'); 
INSERT INTO vehicle (RegNo, RegDate, Owner, Address) VALUES (4, '2014-08-01', 'manoj', 'nasik'); 
INSERT INTO vehicle (RegNo, RegDate, Owner, Address) VALUES (5, '2017-06-01', 'suraj', 'gorakhpur'); 
INSERT INTO vehicle (RegNo, RegDate, Owner, Address) VALUES (6, '2020-03-01', 'mahesh', 'shimla'); 


INSERT INTO offence (Offence_Code, Off_desc, Challan_Amt) VALUES (101, 'wrong side driving', 200); 
INSERT INTO offence (Offence_Code, Off_desc, Challan_Amt) VALUES (102, 'breaking signal', 500); 
INSERT INTO offence (Offence_Code, Off_desc, Challan_Amt) VALUES (103, 'spitting while driving', 400); 
INSERT INTO offence (Offence_Code, Off_desc, Challan_Amt) VALUES (104, 'throwing waste', 300);
INSERT INTO offence (Offence_Code, Off_desc, Challan_Amt) VALUES (105, 'rash driving', 1000); 
INSERT INTO offence (Offence_Code, Off_desc, Challan_Amt) VALUES (106, 'damage of any vehicle', 2000); 


INSERT INTO chalaan (Challan_No, ch_date, RegNo,offence) VALUES (3001, '2004-10-10', 1,101); 
INSERT INTO chalaan (Challan_No, ch_date, RegNo,offence) VALUES (3002, '2007-03-13', 2,106); 
INSERT INTO chalaan (Challan_No, ch_date, RegNo,offence) VALUES (3003, '2005-02-10', 4,104); 
INSERT INTO chalaan (Challan_No, ch_date, RegNo,offence) VALUES (3004, '2008-08-14', 3,103); 
INSERT INTO chalaan (Challan_No, ch_date, RegNo,offence) VALUES (3005, '2015-06-17', 5,102); 
INSERT INTO chalaan (Challan_No, ch_date, RegNo,offence) VALUES (3006, '2020-10-10', 6,105); 


/* Q19. Display the dates of first registration and last registration from the table Vehicle. */
select min(RegDate),max(RegDate) from vehicle;

/* Q20. Display the number of challans issued on each date. */
select count(*) 'total chalans', ch_date from chalaan group by ch_date;

/* Q21. Display the total number of challans issued for each offence. */
select Offence, count(*) 'total chalans' from chalaan group by Offence;


/* Q22. Display the total number of vehicles for which the 3rd and 4th characters of RegNo are
‘6C’. */
 select count(RegNo)  from vehicle where RegNo like '_ _6C%';
 
 
/* Q23. Display the total value of challans issued for which the Off_Desc is ‘Driving without
License’. */
select count(Challan_No) 'chalaan on without license' from chalaan where Offence = (select Offence_Code from offence where off_desc='Driving without License');


/* Q24. Display details of the challans issued on ‘2010-04-03’ along with Off_Desc for each
challan */
select Challan_No, ch_date, RegNo ,chalaan.Offence ,Off_desc from chalaan, offence where chalaan.Offence = offence.Offence_Code and ch_date='2010-04-03';


/* Q25. Display the RegNo of all vehicles which have been challaned more than once. */
select RegNo, count(Challan_No)from chalaan group by RegNo having count(Challan_No)>1;


/* Q26. Display details of each challan along with vehicle details, Off_desc, and Challan_Amt. */
 select * from vehicle,chalaan,offence where vehicle.RegNo=chalaan.RegNo and chalaan.Offence=offence.offence_code ;
 
 
 
 