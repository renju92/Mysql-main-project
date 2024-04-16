## creation of database
create database library;
use library;

##creation of table 1 named branch
create table branch(
branch_no int primary key, 
manager_id int,
branch_address varchar(50),
contact_no int );

##creation of table 2 named employee
create table employee(
emp_id int primary key,
emp_name varchar(20),
position varchar(15),
salary float,
branch_no int,
foreign key(branch_no) references branch(branch_no)
);

##creation of table 3 named customer
create table customer(
customer_id int primary key,
customer_name varchar(20),
customer_address varchar(50),
reg_date timestamp
);
ALTER TABLE customer
DROP COLUMN reg_date;
ALTER TABLE customer
ADD COLUMN reg_date date;
UPDATE customer SET reg_date = '2012-09-09' WHERE customer_id = 401;
UPDATE customer SET reg_date = '2021-09-09' WHERE customer_id = 402;
UPDATE customer SET reg_date = '2023-09-09' WHERE customer_id = 403;
UPDATE customer SET reg_date = '2024-04-09' WHERE customer_id = 404;
UPDATE customer SET reg_date = '2023-06-09' WHERE customer_id = 405;
UPDATE customer SET reg_date = '2024-02-09' WHERE customer_id = 406;
UPDATE customer SET reg_date = '2023-08-09' WHERE customer_id = 407;
UPDATE customer SET reg_date = '2022-01-09' WHERE customer_id = 408;
UPDATE customer SET reg_date = '2022-02-09' WHERE customer_id = 409;
UPDATE customer SET reg_date = '2021-04-09' WHERE customer_id = 410;


##creation of table 4 books
create table books(
isbn int primary key,
book_title varchar(30),
category varchar(20),
rental_price float,
status enum('yes','no') default 'yes',
author varchar(30),
publisher varchar(30)
);
alter table  books drop column status;
alter table books add column book_status enum('yes','no');

##creation of table 5 issuestatus
create table issue_status(
issue_id int primary key,
issued_cust int,
issued_book_name varchar(50),
issue_date timestamp,
isbn_book int,
foreign key(issued_cust) references customer(customer_id),
foreign key(isbn_book) references books(isbn)
);
alter table issue_status modify issue_date date;
##creation of table 6 returnstatus
create table returnstatus(
return_id int primary key,
return_cust varchar(20),
return_book_name varchar(50),
return_date timestamp,
isbn_book2 int,
foreign key(isbn_book2) references books(isbn)
);

##insertion of values in table  1 branch
insert into branch(branch_no,manager_id,branch_address,contact_no)
values
(101,201,'thiruvananthapuram',6),
(102,202,'kollam',876543),
(103,203,'pathanamthitta',765432198),
(104,204,'allapuzha',654321987),
(105,205,'kottayam',543210987),
(106,206,'idukki',4321567890),
(107,207,'ernakulam',321098765),
(108,208,'thrissur',210987654),
(109,209,'palakkad',1098765432),
(110,210,'malapuram',231678908);
select * from branch;

##insertion of values in table  2 employee
insert into employee values(301,'ram kumar','manager',34000,101);
insert into employee values(302,'syam kumar','manager',43000,102);
insert into employee values(303,'ravi kumar','manager',64000,103);
insert into employee values(304,'sree kumar','manager',35000,104);
insert into employee values(305,'seema kumar','manager',47000,105);
insert into employee values(306,'riya kumar','manager',34000,106);
insert into employee values(307,'rema kumar','manager',37000,107);
insert into employee values(308,'leka kumar','manager',38000,108);
insert into employee values(309,'lija kumar','manager',39000,109);
insert into employee values(310,'miya kumar','manager',34000,110);
select * from employee;

##insertion of values in table  3 customer
insert into customer values(401,'anil john','mankavu,calicut',now());
insert into customer values(402,'antony john','thirunakkara,thrivandrum',now());
insert into customer values(403,'macley john','thiruvalla,pathanamthitta',now());
insert into customer values(404,'sharon john','anchal,kollam',now());
insert into customer values(405,'meera john','mananthavady,wayanad',now());
insert into customer values(406,'shalu john','changanasserry,kottayam',now());
insert into customer values(407,'sabu john','mankavu,calicut',now());
insert into customer values(408,'milu john','mankavu,calicut',now());
insert into customer values(409,'seetha john','mankavu,calicut',now());
insert into customer values(410,'jimmy john','mankavu,calicut',now());
select * from customer;
desc books;
##insertion of values in table 4 books
insert into books values(501,'Vinayak Varma','Pratham Books','Ammachi’s Investigation','love',234,'yes');
insert into books values(502,'Manorama Mishra','Not specified','Sanskriti ke Ayaam','Culture',345,'no');
insert into books values(503,'Sanjeev Joshi','pratham books','Ek Samandar, Mere Andar','Fiction',543,'yes');
insert into books values(504,'Dr. Rajen Saikia','Political History of Assam','ragam books','History',334,'yes');
insert into books values(505,'Arup Kumar Dutta','priyam books','Assam’s Braveheart – Lachit Barphukan','Biography',256,'yes');
insert into books values(506,'M.J. Akbar and K Natwar Singh','d c books','Gandhi: A Life in Three Campaigns','Biography',234,'no');
insert into books values(507,'R.K. Pachnanda','b p books','Modi: Energising A Green Future','Politics',678,'yes');
insert into books values(508,'General Manoj Mukund Naravane','oxford','Four Stars of Destiny','Fiction',980,'no');
insert into books values(509,'Manorama Mishra','lalji book','Sanskriti ke Ayaam','Culture',567,'yes');
insert into books values(510,'Gujarat State Disaster','lalji books','Smritivan: An Unparalleled Apotheosis','Non-fiction',484,'no');
update books set publisher='ragam books',book_title='Political History of Assam' where isbn=504;
select * from books;
select * from customer;
desc issue_status;
##insertion of values in table 5 issuestatus
insert into issue_status values(601,401,'Ammachi’s Investigation','2024-02-12',501); 
insert into issue_status values(602,402,'Ek Samandar, Mere Andar','2024-01-12',503); 
insert into issue_status values(603,403,'Political History of Assam','2023-12-12',504); 
insert into issue_status values(604,404,'Assam’s Braveheart – Lachit Barphukan','2023-11-10',505); 



## 1. Retrieve the book title, category, and rental price of all available books.
select isbn,book_title,category,rental_price from books where book_status='yes';

##2. List the employee names and their respective salaries in descending order of salary.
select emp_name,salary from employee order by salary desc;

##3. Retrieve the book titles and the corresponding customers who have issued those books.
select books.book_title, customer.customer_name from issue_status
join books on issue_status.isbn_book=books.isbn
join customer on issue_status.issued_cust=customer.customer_id;

##4. Display the total count of books in each category
select count(book_title),category from books group by category;


##5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select emp_name,position from employee where salary>50000;

##6. List the customer names who registered before 2022-01-01 and have not issued any books yet
select customer_name from customer where reg_date<'2022-01-01' and 
customer_id not in (select issued_cust from issue_status);

##7. Display the branch numbers and the total count of employees in each branch.
select branch_no,count(emp_name) from employee group by branch_no;

##8. Display the names of customers who have issued books in the month of June 2023
select customer_name from customer 
join issue_status on customer.customer_id=issue_status.issued_cust
where month(issue_status.issue_date)=6 and year(issue_status.issue_date)=2023;

##9. Retrieve book_title from book table containing history. 
select book_title,category from books where category='history';


##10.Retrieve the branch numbers along with the count of employees for branches
##having more than 5 employees.
select branch_no,count(emp_name) from employee group by branch_no  having count(emp_name)>5;

