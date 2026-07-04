select * from pizza.pizza_sales;
DESCRIBE pizza.pizza_sales;
SET SQL_SAFE_UPDATES = 0;
select sum(total_price) from pizza.pizza_sales; -- Total Revenue
select (sum(total_price)/ count(distinct order_id)) from pizza.pizza_sales; -- Average Order Value
select count(quantity) from pizza.pizza_sales; -- Total Pizzas Sold
select distinct count(order_id) from pizza.pizza_sales; -- Total Orders
select (sum(quantity)/ count(distinct order_id)) from pizza.pizza_sales; -- Average Pizzas Per Order
select cast(cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id)as decimal(10,2)) as decimal(10,2)) from pizza.pizza_sales; -- for decimal value

select dayname(str_to_date(order_date, '%d-%m-%y')) as order_day,
count(distinct order_id) as total_orders
from pizza.pizza_sales group by order_day; -- Daily Trend for Total Orders
select monthname(str_to_date(order_date, '%d-%m-%y')) as month_name,
count(distinct order_id) as total_orders
from pizza.pizza_sales group by month(str_to_date(order_date, '%d-%m-%y')), monthname(str_to_date(order_date, '%d-%m-%y')); -- Monthly Trend for Total Orders
select pizza_category, sum(total_price) as total_revenue,
(sum(total_price)*100/(select sum(total_price) from pizza.pizza_sales))
from pizza.pizza_sales group by pizza_category; -- Percentage of Sales by Pizza Category
select pizza_size, sum(total_price) as total_revenue,
(sum(total_price)*100/(select sum(total_price) from pizza.pizza_sales))
from pizza.pizza_sales group by pizza_size; -- Percentage of Sales by Pizza Size
select pizza_category, sum(quantity) as total_quantity_sold from pizza.pizza_sales 
group by pizza_category order by total_quantity_sold; -- Total Pizzas Sold by Pizza Category
select pizza_name_id, sum(total_price) as total_revenue from pizza.pizza_sales 
group by pizza_name_id order by total_revenue desc limit 5; -- Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
select pizza_name_id, sum(total_price) as total_revenue from pizza.pizza_sales 
group by pizza_name_id order by total_revenue asc limit 5; -- Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
