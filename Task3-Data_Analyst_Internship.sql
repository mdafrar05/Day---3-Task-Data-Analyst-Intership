# MySQL Queries for the task 3 of DataAnalyst Internship !!!

--1.Displaying Computer,Mobile Products where SNO greater than 5
SELECT computer_products, mobile_products from products where sno>5;

--2.Displaying Computer Products prices by using joins 
SELECT products.computer_products, products_info.price1
    -> FROM products
    -> INNER JOIN products_info ON products.sno = products_info.sno;

--3.Displaying Light Products using subqueries
SELECT light_products
    -> FROM products
    -> JOIN products_info ON products.sno = products_info.sno
    -> WHERE price1 > (SELECT AVG(price1) FROM products_info);

--4.Displaying Car Products with sum and avg 
SELECT products.car_products,sum(products_info.price6) as totalprice,avg(products_info.price6) as AveragePrice from products join products_info on products.sno= products_info.sno;

--5.Creating a View - CarProducts_Informations 
create view CarProducts_Informations
    -> As select products.car_products, products_info.price6, products_quantity.limit6
    -> from products join products_info on products.sno = products_info.sno
    -> join products_quantity on products.sno = products_quantity.sno;

--6.Displaying the table created from the view
select * from CarProducts_Informations;

--7.Optimize Queries with Indexes
create index idx_television_products on products(television_products);

--8.Displayting average Price of Each Product Type
SELECT AVG(price1) AS avg_computer_price, AVG(price2) AS avg_mobile_price, AVG(price3) AS avg_car_price
    -> FROM products_info;

--9.Total Stock Count Across All Products
 SELECT SUM(limit1) AS total_computer_stock, SUM(limit2) AS total_mobile_stock, SUM(limit3) AS total_car_stock
    -> FROM products_quantity;

--10.Products with high stock counts
SELECT computer_products, mobile_products, car_products, limit1, limit2, limit3
    -> FROM products
    -> JOIN products_quantity ON products.sno = products_quantity.sno
    -> WHERE limit1 > 25 OR limit2 > 30 OR limit3 > 35;






















