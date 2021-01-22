<<<<<<< HEAD
/* create tables queries */

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
select COUNT(admno) as Number_of_Students, class as Name_of_Class from student where class='10' OR class='11' OR class='12';

/*Q3. Display the number of students in class 10  */ 
select COUNT(admno) as Number_of_Students_of_Class_10th from student where class='10';

/* Q4. Display details of the students of Cricket team */
select * from student 
inner join sports on student.admno = sports.admno
where game='Cricket';

/* Q5. Display the Admission number, name, class, section, and roll number of the students whose grade in the Sports table is ‘A’. */
select * from student 
inner join sports on student.admno = sports.admno
where grade='A';

/* Q6.  Display the name and phone number of the students of class 12 who are playing some game. */
select name,phone,game from student
right join sports on student.admno = sports.admno
where class='12' group by name;

/*Q7. Display the number of students with each coach. */
select count(class) as Number_of_students, coachname as Coach from student 
left outer join sports on student.admno = sports.admno
where coachname=coachname;


/*Q8. Display the names and phone numbers of the students whose grade is ‘A’ and whose coach is Narendra. */
select name, phone from student 
inner join sports on student.admno = sports.admno
where grade='A' AND coachname='Narendra';


-- SELECT TABLE_SCHEMA, sports ,admno, foreign_key
-- FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
-- WHERE
--     REFERENCED_TABLE_SCHEMA IS NOT NULL;
--     

 SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA IS NOT NULL AND TABLE_SCHEMA ="students";
 
  SELECT class, sec, count(*) FROM student GROUP BY class, sec; 
  
  /*Create table Queries */
=======
/*Create table Queries */
>>>>>>> 05b00643e7c91ac1edaa091c9a93c8c016496fbe

create table items(i_code int primary key,name varchar(100), category varchar(100),rate int);
create table bills(billno int,date date, i_code int, foreign key(i_code) references items(i_code),qty int);


<<<<<<< HEAD
-- create table vehicle(field varchar(100),date date, i_code int, foreign key(i_code) references items(i_code),qty int); --
=======
create table vehicle(field varchar(100),date date, i_code int, foreign key(i_code) references items(i_code),qty int);
>>>>>>> 05b00643e7c91ac1edaa091c9a93c8c016496fbe

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
 
<<<<<<< HEAD
 -- Q14. Display total quantity of each item sold but don’t display this data for the items whose total quantity sold is less than 3. --
  select i_code, sum(qty) from bills group by i_code  having sum(qty)>3;

-- Q15. Display the details of bill records along with the Name of each corresponding item.--
select items.name 'Item Name',bills.billno 'Bill no', bills.date 'Bill Date', bills.i_code 'Bill code', bills.qty 'Bill QTY' from items right join bills on items.i_code = bills.i_code;

/*optional soln*/
select billno,date, bills.I_code,name,qty from items,bills where items.i_code=bills.i_code;
=======
 
 -- doubt--
 -- Q14. Display total quantity of each item sold but don’t display this data for the items whose total quantity sold is less than 3. --
 select name as Item_name,SUM(qty) as Total_Quanity_sold  from items right join bills on items.i_code = bills.i_code group by name  ;


-- Q15. Display the details of bill records along with the Name of each corresponding item.--
select billno as Bill_records, name as Name_of_Item from items left join bills on items.i_code = bills.i_code group by billno,name;
>>>>>>> 05b00643e7c91ac1edaa091c9a93c8c016496fbe

-- Q16. Display the details of the bill records for which the item is ‘Dosa’. --
select * from bills left join items on bills.i_code = items.i_code where name='Masala Dosa';

<<<<<<< HEAD
/*optional*/
select items.name 'Item Name',billno,date,bills.i_code,qty from items,bills where items.i_code = bills.i_code and name like '%Dosa';

--  Q17. Display the bill records for each Italian item sold.  --
select * from bills left join items on bills.i_code = items.i_code where category='Italian';

select items.name 'Item name', items.category 'Category' ,bills.billno 'Bill no', bills.date 'Bill Date', bills.i_code 'Bill code', bills.qty 'Bill QTY'
from items,bills where items.i_code = bills.i_code AND  items.category='Italian';


   -- Q18. Display the total value of items sold for each bill--
  select bills.billno 'Bill no', items.name 'item Name', sum(bills.qty) 'Sum of Quantity', items.rate 'Rate', sum(bills.qty) * (items.rate) 'Total Sell' from items,bills where items.i_code = bills.i_code group by items.name; 
  
  select billno,sum(qty) 'total item sold' from bills group by billno;
  
  
  
=======
--  Q17. Display the bill records for each Italian item sold.  --
select * from bills left join items on bills.i_code = items.i_code where category='Italian';


--    Q18. Display the total value of items sold for each bill--
>>>>>>> 05b00643e7c91ac1edaa091c9a93c8c016496fbe
