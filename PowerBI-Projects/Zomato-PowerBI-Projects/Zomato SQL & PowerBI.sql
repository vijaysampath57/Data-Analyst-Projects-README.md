create database Zomato;
use Zomato;
## order_id	restaurant_id	customer_id	order_date	order_time	delivery_time	total_cost	item_count	payment_method	customer_rating
create table Zomato_Orders
(order_id varchar(100), 
restaurant_id varchar(100),
customer_id varchar(100), 
order_date date,
order_time time, 
delivery_time int,
total_cost int,
item_count int, 
payment_method varchar(20), 
customer_rating int);

## restaurant_id	restaurant_name	city	area	cuisine	avg_rating	total_ratings	price_range	delivery_available
create table Zomato_Restaurant
(restaurant_id varchar(100), 
restaurant_name varchar(200), 
city varchar(100),
area varchar(20), 
cuisine varchar(100), 
avg_rating int, 
total_ratings int,
price_range varchar(20),
delivery_available varchar(10));
