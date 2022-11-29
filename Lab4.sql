create database lab4;
use lab4;


/*
Question 1) - 
You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data 
for the E-commerce with the schema definition given below.

Question 2) -
Insert the following data in the table created above
*/

-- Table 1: Suppliers
-- Table Created
create table supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) Not Null,
SUPP_CITY varchar(50) Not Null,
SUPP_PHONE varchar(50) Not Null
);

-- Values Inserted
insert into supplier value(1, "Rajesh Retails", "Delhi", 1234567890);
insert into supplier value(2, "Appario Ltd.", "Mumbai", 2589631470);
insert into supplier value(3, "Knome products", "Banglore", 9785462315);
insert into supplier value(4, "Bansal Retails", "Kochi", 8975463285);
insert into supplier value(5, "Mittal Ltd.", "Lucknow", 7898456532);

select * from supplier;



-- Table 2: Customer
-- Table Created
create table customer(
CUS_ID int primary key,
CUS_NAME varchar(20) Not Null,
CUS_PHONE varchar(10) Not Null,
CUS_CITY varchar(30) Not Null,
CUS_GENDER char
);

-- Values Inserted
insert into customer value(1, "AAKASH", 9999999999, "DELHI", "M");
insert into customer value(2, "AMAN", 9785463215, "NOIDA", "M");
insert into customer value(3, "NEHA", 9999999999, "MUMBAI", "F");
insert into customer value(4, "MEGHA", 9994562399, "KOLKATA", "F");
insert into customer value(5, "PULKIT", 7895999999, "LUCKNOW", "M");

select * from customer;



-- Table 3: Category
-- Table Created
create table category(
CAT_ID int primary key,
CAT_NAME varchar(20) Not Null
);

-- Values Inserted
insert into category value(1, "BOOKS");
insert into category value(2, "GAMES");
insert into category value(3, "GROCERIES");
insert into category value(4, "ELECTRONICS");
insert into category value(5, "CLOTHES");

select * from category;



-- Table 4: Product
-- Table Created
create table product(
PRO_ID int primary key,
PRO_NAME varchar(20) Not Null default "dummy",
PRO_DESC varchar(60),
CAT_ID int,
foreign key(CAT_ID) REFERENCES category(CAT_ID)
);

-- Values Inserted
insert into product value(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product value(2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product value(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product value(4, "OATS", "Highly Nutritious from Nestle", 3);
insert into product value(5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into product value(6, "MILK", "1L Toned MIlk", 3);
insert into product value(7, "Boat Earphones", "1.5 Meter long Dolby Atmos", 4);
insert into product value(8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into product value(9, "Project IGI", "compatible with windows 7 and above", 2);
insert into product value(10, "Hoodie" ,"Black GUCCI for 13 yrs and above", 5);
insert into product value(11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
insert into product value(12, "Train Your Brain", "By Shireen Stephen", 1);

select * from product;



-- Table 5: Supplier_pricing
-- Table Created
create table supplier_pricing(
PRICING_ID int primary key,
PRO_ID int,
foreign key(PRO_ID) REFERENCES product(PRO_ID),
SUPP_ID int,
foreign key(SUPP_ID) REFERENCES supplier(SUPP_ID),
SUPP_PRICE int default 0
);

-- Values Inserted
insert into supplier_pricing value(1, 1, 2, 1500);
insert into supplier_pricing value(2, 3, 5, 30000);
insert into supplier_pricing value(3, 5, 1, 3000);
insert into supplier_pricing value(4, 2, 3, 2500);
insert into supplier_pricing value(5, 4, 1, 1000);

select * from supplier_pricing;


-- Table 6: Orders
-- Table Created
create table orders(
ORD_ID int primary key,
ORD_AMOUNT int Not Null,
ORD_DATE date Not Null,
CUS_ID int,
foreign key(CUS_ID) REFERENCES customer(CUS_ID),
PRICING_ID int,
foreign key(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

-- Values Inserted
insert into orders value(101, 1500, 20210106, 2, 1);
insert into orders value(102, 1000, 20211012, 3, 5);
insert into orders value(103, 30000, 20210916, 5, 2);
insert into orders value(104, 1500, 20211005, 1, 1);
insert into orders value(105, 3000, 20210816, 4, 3);
insert into orders value(109, 3000, 20210110, 5, 3);
insert into orders value(110, 2500, 20210910, 2, 4);
insert into orders value(111, 1000, 20210915, 4, 5);
insert into orders value(114, 1000, 20210916, 3, 5);
insert into orders value(115, 3000, 20210916, 5, 3);

select * from orders;

/*
insert into orders value(106, 1450, 20210818, 1, 9);
insert into orders value(107, 789, 20210901, 3, 7);
insert into orders value(108, 780, 20210907, 5, 6);
insert into orders value(112, 789, 20210916, 4, 7);
insert into orders value(113, 31000, 20210916, 1, 8);
insert into orders value(116, 99, 20210917, 2, 14);
*/



-- Table 7: Rating
-- Table Created
create table rating(
RAT_ID int primary key,
ORD_ID int,
foreign key(ORD_ID) REFERENCES orders(ORD_ID),
RAT_RATSTARS int Not Null
);

-- Values Inserted
insert into rating value(1, 101, 4);
insert into rating value(2, 102, 3);
insert into rating value(3, 103, 1);
insert into rating value(4, 104, 2);
insert into rating value(5, 105, 4);
insert into rating value(9, 109, 3);
insert into rating value(10, 110, 5);
insert into rating value(11, 111, 3);
insert into rating value(14, 114, 1);
insert into rating value(15, 115, 1);

select * from rating;

/*
insert into rating value(6, 106, 3);
insert into rating value(7, 107, 4);
insert into rating value(8, 108, 4);
insert into rating value(12, 112, 4);
insert into rating value(13, 113, 2);
insert into rating value(16, 116, 0);
*/



-- Queries
-- Question 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select count(table2.cus_gender) as NoOfCustomers, table2.cus_gender from 
(select table1.CUS_ID, table1.CUS_GENDER from
(select `orders`.*, customer.CUS_GENDER from `orders` inner join customer where `orders`.CUS_ID = customer.CUS_ID and `orders`.ORD_AMOUNT>=3000)
as table1 group by  table1.CUS_ID) as table2 group by table2.CUS_GENDER


-- Question 4) Display all the orders along with product name ordered by a customer having Customer_Id=2.
select product.PRO_NAME, `orders`.* from `orders`, supplier_pricing, product 
where `orders`.cus_id=2 and 
`orders`.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;


-- Question 5) Display the Supplier details who can supply more than one product.
select supplier.* from supplier where supplier.SUPP_ID in
(select SUPP_ID from supplier_pricing group by SUPP_ID having count(SUPP_ID)>1) 
group by supplier.SUPP_ID;


-- Question 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product.
select category.cat_id,category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join  
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id) 
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;


-- Question 7) Display the Id and Name of the Product ordered after “2021-10-05”.
select product.pro_id,product.pro_name from `orders` inner join supplier_pricing on supplier_pricing.pricing_id=`orders`.pricing_id 
inner join product on product.pro_id=supplier_pricing.pro_id where `orders`.ord_date>"2021-10-05";


-- Question 8) Display customer name and gender whose names start or end with character 'A'.
select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';


-- Question 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent
-- Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
delimiter $$
create procedure Rate_procedure()
begin
select SUPP_ID,SUPP_NAME,Avg_rating,
case when Avg_rating = 5 then 'Excellent Service'
when Avg_rating > 4 then 'Good Service'
when Avg_rating > 2 then 'Average Service'
else 'Poor Service'
end as Type_of_Service from (select sp.SUPP_ID,s.SUPP_NAME,avg(r.rat_ratstars) as Avg_rating
from rating as r ,`orders` as o,supplier_pricing as sp, supplier as s where r.ORD_ID = o.ORD_ID and sp.PRICING_ID = o.PRICING_ID and s.SUPP_ID = sp.SUPP_ID group by sp.SUPP_ID ) as T1;
end $$
delimiter ;

call Rate_procedure(); -- Execute this portion of script to display required itmes.