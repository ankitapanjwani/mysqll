/*section 1*/
create table student(admn_no int primary key, sname varchar(100), class varchar(50),section varchar(10), rno int(10), address varchar(100), phone varchar(10));
create table sports(admn_no int,foreign key(admn_no) references student(admn_no), game varchar(100), coachname varchar(50), grade varchar(10) );


INSERT INTO student (admn_no, sname, class, section, rno,address , phone) VALUES (1271 , 'Utkarsh  Madaan ', 12 , 'C', 1,'C-32 Punjabi Bagh', 4356154);
INSERT INTO sports (admn_no,game, coachname, grade) VALUES (1271,'Volleball ','M.P. Singh ','B');
INSERT INTO sports (admn_no,game, coachname, grade) VALUES (1324 ,'Cricket ','Narendra ','A');
INSERT INTO sports (admn_no,game, coachname, grade) VALUES (1364 ,'Volleball ','M.P. Singh','A');
INSERT INTO sports (admn_no,game, coachname, grade) VALUES (1434 ,'Basket Ball ','I. Malhotra ','B ');
INSERT INTO sports (admn_no,game, coachname, grade) VALUES (1461 ,'Cricket ','Narendra','B');
INSERT INTO sports (admn_no,game, coachname, grade) VALUES (1271  ,'Basket Ball  ','I. Malhotra','A ');
INSERT INTO sports (admn_no,game, coachname, grade) VALUES (1434  ,'Cricket  ','Narendra','A');
INSERT INTO sports (admn_no,game, coachname, grade) VALUES (1364  ,'Basket Ball ','I. Malhotra','B ');

/*1*/

select MIN(class) 'minimum', MAX(class) 'maximum' from student;

select count(admn_no), class from student group by class;

select class, count(*) as student FROM student WHERE class =10;

select * 
from student 
inner join sports on student.admn_no = sports.admn_no
where game = 'cricket';

select student.admn_no, sname,class ,section ,rno
from student 
inner join sports on student.admn_no = sports.admn_no
where grade = 'A';

select count(*) 'total_student'
from student 
inner join sports on student.admn_no = sports.admn_no
where grade = 'A';

select count(admn_no), coachname from sports group by coachname;

select sname, phone 
from student 
inner join sports on student.admn_no = sports.admn_no
where grade = 'A' AND coachname = 'Narendra';


SELECT TABLE_SCHEMA,TABLE_NAME,
       COLUMN_NAME,
       COLUMN_NAME,
       CONSTRAINT_NAME,
       REFERENCED_TABLE_NAME,
       REFERENCED_COLUMN_NAME
FROM KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = "mysql_assignment" ;

SELECT class, section, count(*) 'total_student' FROM student GROUP BY class, section; 
SELECT game, COUNT(*) 'total_student' FROM sports GROUP BY game; 
SELECT game, sname, address FROM student, sports WHERE student.admn_no = sports.admn_no AND grade = 'A'; 
SELECT game FROM student, sports WHERE student.admn_no = sports.admn_no AND student.admn_no = 1434; 


/*Section 2*/
/*Create table Queries */

create table items(i_code int primary key,name varchar(100), category varchar(100),rate int);
create table bills(billno int,date date, i_code int, foreign key(i_code) references items(i_code),qty int);

-- create table vehicle(field varchar(100),date date, i_code int, foreign key(i_code) references items(i_code),qty int); --

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

select items.name 'Item name', items.category 'Category' ,bills.billno 'Bill no', bills.date 'Bill Date', bills.i_code 'Bill code', bills.qty 'Bill QTY'
from items,bills where items.i_code = bills.i_code AND  items.category='Italian';


   -- Q18. Display the total value of items sold for each bill--
  select bills.billno 'Bill no', items.name 'item Name', sum(bills.qty) 'Sum of Quantity', items.rate 'Rate', sum(bills.qty) * (items.rate) 'Total Sell' from items,bills where items.i_code = bills.i_code group by items.name; 
  
  select billno,sum(qty) 'total item sold' from bills group by billno;


/*section 3*/
create table vehicle(RegNo  char(10)  primary key NOT NULL, RegDate date , Owner  varchar(30),Address varchar(50));

create table chalaan( Challan_No int(11) primary key NOT NULL,ch_date  date , RegNo char(10), foreign key(RegNo) references vehicle(RegNo),Offence int(3), foreign key(Offence) references offence(Offence_Code));

create table offence(  Offence_Code   int(3)  primary key NOT NULL, Off_desc varchar(30),  Challan_Amt  int(4));

/* 1 */
select min(RegDate),max(RegDate) from vehicle;
/* 2 */
select count(*) 'total chalans', ch_date from chalaan group by ch_date;
/* 3 */
select Offence, count(*) 'total chalans' from chalaan group by Offence;
/* 4 */
 select count(RegNo)  from vehicle where RegNo like '_ _6C%';
/* 5 */
select count(Challan_No) 'chalaan on without license' from chalaan where Offence = (select Offence_Code from offence where off_desc='Driving without License');
/* 6 */
select Challan_No, ch_date, RegNo ,chalaan.Offence ,Off_desc from chalaan, offence where chalaan.Offence = offence.Offence_Code and ch_date='2010-04-03';
/* 7 */
select RegNo, count(Challan_No)from chalaan group by RegNo having count(Challan_No)>1;
/* 8 */
 select * from vehicle,chalaan,offence where vehicle.RegNo=chalaan.RegNo and chalaan.Offence=offence.offence_code ;