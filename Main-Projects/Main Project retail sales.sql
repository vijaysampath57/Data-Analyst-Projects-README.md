create database retail_sales;
use	retail_sales;

-- Categories(category_id	category_name)
create table retail_sales.categories
(category_id int primary key,
category_name varchar(200) not null);

-- Brands(brand_id	brand_name)
create table retail_sales.brands
(brand_id int primary key,
brand_name varchar(200) not null);

-- Customers(customer_id	first_name	last_name	phone	email	street	city	state	zip_code)
create table retail_sales.customers
(customer_id int, 
first_name varchar(100),
last_name varchar(100),
phone varchar(25),
email varchar(200),
street varchar(200),
city varchar(100),
zipcode varchar(25));
alter table retail_sales.customers add column state varchar(5);
 
-- Order_items(order_id	item_id	product_id	quantity	list_price	discount	total_sales	product_names)
create table retail_sales.order_items
(order_id int not null,
item_id int not null,
product_id int not null,
quantity int not null,
list_price decimal(10,2),
discount decimal default 0 not null);
alter table retail_sales.order_items add column total_sales int not null, add column product_names varchar(200) not null;

-- orders(order_id	customer_id	order_status	order_date	required_date	shipped_date	store_id	staff_id)
create table retail_sales.orders
(order_id int not null,
customer_id int not null,
order_status varchar(15),
order_date date not null,
required_date date not null,
shipped_date date,
store_id int not null,
staff_id int not null);

-- products(product_id	product_name	brand_id	category_id	model_year	list_price)
create table retail_sales.products
(product_id int not null,
product_name varchar(300) not null,
brand_id int not null,
category_id int not null,
model_year int not null,
list_price int not null);

-- staffs(staff_id	first_name	last_name	email	phone	active	store_id	manager_id)
create table retail_sales.staffs
(staff_id int not null,
first_name varchar(100) not null,
last_name varchar(100) not null,
email varchar(200) not null,
phone varchar(25) not null,
active int not null,
store_id int not null,
manager_id int);

-- stocks(store_id	product_id	quantity)
create table retail_sales.stocks
(store_id int not null,
product_id int not null,
quantity int not null);

-- Stores(store_id	store_name	phone	email	street	city	state	zip_code)
create table retail_sales.stores
(store_id int not null,
store_name varchar(20) not null,
phone varchar(25) not null,
email varchar(100) not null,
street varchar(200) not null,
city varchar(100) not null,
state varchar(5) not null,
zip_code varchar(25) not null);

-- product_sales(product_name	 sales)
create table retail_sales.product_sales
(product_name varchar(200) not null,
sales int not null);

use retail_sales;

## Inner Join for Order Details 
select 
o.order_id,
o.customer_id,
o.order_status,
o.order_date,
o.required_date,
o.shipped_date,
o.store_id,
o.staff_id,
oi.item_id,
oi.quantity,
oi.list_price,
oi.discount,
(oi.quantity * oi.list_price * oi.discount) as line_total,
p.product_id,
p.product_name,
p.brand_id,
p.category_id,
p.model_year,
p.list_price
from retail_sales.orders as o
inner join order_items as oi 
on o.order_id = oi.order_id
inner join products as p 
on oi.product_id = p.product_id
order by o.order_id,oi.item_id;

## Total Sales by Store 
select s.store_id, s.store_name,
SUM(oi.quantity * oi.list_price * oi.discount) as total_sales
from stores as s
inner join orders as o 
on s.store_id = o.store_id
inner join order_items as oi 
on o.order_id = oi.order_id
group by s.store_id, s.store_name
order by total_sales desc;

## Top 5 Selling Products 
select p.product_id, p.product_name,
SUM(oi.quantity) as total_quantity
from products as p
inner join order_items as oi 
on p.product_id = oi.product_id
group by p.product_id, p.product_name
order by total_quantity desc limit 5;

## Customer Purchase Summary 
select c.customer_id, c.first_name, c.last_name,
count(distinct o.order_id) as total_orders,
sum(oi.quantity) as total_items,
sum(oi.quantity * oi.list_price * oi.discount) as total_revenue
from customers as c
inner join orders as o on c.customer_id = o.customer_id
inner join order_items as oi on o.order_id = oi.order_id
group by c.customer_id, c.first_name, c.last_name
order by total_revenue desc;

## Segment Customers by Total Spend
select c.customer_id, c.first_name, c.last_name,
sum(oi.quantity * oi.list_price * oi.discount) as total_spend,
case when SUM(oi.quantity * oi.list_price * oi.discount) >= 6000 then 'High'
when sum(oi.quantity * oi.list_price *  oi.discount) >= 2500 then 'Medium'
else 'Low' end as customer_tier
from customers as c
inner join orders as o on c.customer_id = o.customer_id
inner join order_items as oi on o.order_id = oi.order_id
group by c.customer_id, c.first_name, c.last_name
order by total_spend desc;

## Staff Performance Analysis 
select st.staff_id,st.first_name,
count(distinct o.order_id) as total_orders,
sum(oi.quantity * oi.list_price) as total_revenue
from staffs as st
inner join orders  as o on st.staff_id = o.staff_id
inner join order_items as oi on o.order_id = oi.order_id
group by st.staff_id, st.first_name
order by total_revenue desc;

## Stock Alert Query 
select p.product_id,p.product_name,s.store_id,s.quantity as total_quantity
from stocks as s
inner join products as p
on s.product_id=p.product_id
inner join stores as st
on s.store_id = st.store_id
where s.quantity <10
order by s.quantity asc,s.store_id;

## Create Final Segmentation Table 
CREATE TABLE retail_sales.customer_segments
(customer_id INT PRIMARY KEY, segment_name VARCHAR(50));
