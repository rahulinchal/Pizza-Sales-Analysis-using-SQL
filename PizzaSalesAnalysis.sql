Create database PizzaProject;

use PizzaProject;

show tables;

select * from order_details;
select * from orders;
select * from pizzas;

/* Basic:
1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.


Intermediate:
1. Join the necessary tables to find the total quantity of each pizza category ordered.
2. Determine the distribution of orders by hour of the day.
3. Join relevant tables to find the category-wise distribution of pizzas.
4. Group the orders by date and calculate the average number of pizzas ordered per day.
5. Determine the top 3 most ordered pizza types based on revenue.

Advanced:
Calculate the percentage contribution of each pizza type to total revenue.
Analyze the cumulative revenue generated over time.
Determine the top 3 most ordered pizza types based on revenue for each pizza category. */




select * from order_details;
select * from orders;
select * from pizzas;

drop table orders;

create table orders(
	order_id int not null,
	order_date date not null,
	order_time time not null,
	primary key(order_id)
);

create table pizza_types(
	pizze_type_id varchar(50) not null,
	name varchar(50) not null,
	category varchar(50) not null,
	ingredients varchar(50) not null
);

drop table pizza_types;


CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(20),
    name VARCHAR(100),
    category VARCHAR(50),
    ingredients TEXT
);

INSERT INTO pizza_types (pizza_type_id, name, category, ingredients) VALUES
('bbq_ckn', 'The Barbecue Chicken Pizza', 'Chicken', 'Barbecued Chicken, Red Peppers, Green Peppers, Tomatoes, Red Onions, Barbecue Sauce'),
('cali_ckn', 'The California Chicken Pizza', 'Chicken', 'Chicken, Artichoke, Spinach, Garlic, Jalapeno Peppers, Fontina Cheese, Gouda Cheese'),
('ckn_alfredo', 'The Chicken Alfredo Pizza', 'Chicken', 'Chicken, Red Onions, Red Peppers, Mushrooms, Asiago Cheese, Alfredo Sauce'),
('ckn_pesto', 'The Chicken Pesto Pizza', 'Chicken', 'Chicken, Tomatoes, Red Peppers, Spinach, Garlic, Pesto Sauce'),
('southw_ckn', 'The Southwest Chicken Pizza', 'Chicken', 'Chicken, Tomatoes, Red Peppers, Red Onions, Jalapeno Peppers, Corn, Cilantro, Chipotle Sauce'),
('thai_ckn', 'The Thai Chicken Pizza', 'Chicken', 'Chicken, Pineapple, Tomatoes, Red Peppers, Thai Sweet Chilli Sauce'),
('big_meat', 'The Big Meat Pizza', 'Classic', 'Bacon, Pepperoni, Italian Sausage, Chorizo Sausage'),
('classic_dlx', 'The Classic Deluxe Pizza', 'Classic', 'Pepperoni, Mushrooms, Red Onions, Red Peppers, Bacon'),
('hawaiian', 'The Hawaiian Pizza', 'Classic', 'Sliced Ham, Pineapple, Mozzarella Cheese'),
('ital_cpcllo', 'The Italian Capocollo Pizza', 'Classic', 'Capocollo, Red Peppers, Tomatoes, Goat Cheese, Garlic, Oregano'),
('napolitana', 'The Napolitana Pizza', 'Classic', 'Tomatoes, Anchovies, Green Olives, Red Onions, Garlic'),
('pep_msh_pep', 'The Pepperoni, Mushroom, and Peppers Pizza', 'Classic', 'Pepperoni, Mushrooms, Green Peppers'),
('pepperoni', 'The Pepperoni Pizza', 'Classic', 'Mozzarella Cheese, Pepperoni'),
('the_greek', 'The Greek Pizza', 'Classic', 'Kalamata Olives, Feta Cheese, Tomatoes, Garlic, Beef Chuck Roast, Red Onions'),
('brie_carre', 'The Brie Carre Pizza', 'Supreme', 'Brie Carre Cheese, Prosciutto, Caramelized Onions, Pears, Thyme, Garlic'),
('calabrese', 'The Calabrese Pizza', 'Supreme', 'Nduja Salami, Pancetta, Tomatoes, Red Onions, Friggitello Peppers, Garlic'),
('ital_supr', 'The Italian Supreme Pizza', 'Supreme', 'Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic'),
('peppr_salami', 'The Pepper Salami Pizza', 'Supreme', 'Genoa Salami, Capocollo, Pepperoni, Tomatoes, Asiago Cheese, Garlic'),
('prsc_argla', 'The Prosciutto and Arugula Pizza', 'Supreme', 'Prosciutto di San Daniele, Arugula, Mozzarella Cheese'),
('sicilian', 'The Sicilian Pizza', 'Supreme', 'Coarse Sicilian Salami, Tomatoes, Green Olives, Luganega Sausage, Onions, Garlic'),
('soppressata', 'The Soppressata Pizza', 'Supreme', 'Soppressata Salami, Fontina Cheese, Mozzarella Cheese, Mushrooms, Garlic'),
('spicy_ital', 'The Spicy Italian Pizza', 'Supreme', 'Capocollo, Tomatoes, Goat Cheese, Artichokes, Peperoncini verdi, Garlic'),
('spinach_supr', 'The Spinach Supreme Pizza', 'Supreme', 'Spinach, Red Onions, Pepperoni, Tomatoes, Artichokes, Kalamata Olives, Garlic, Asiago Cheese'),
('five_cheese', 'The Five Cheese Pizza', 'Veggie', 'Mozzarella Cheese, Provolone Cheese, Smoked Gouda Cheese, Romano Cheese, Blue Cheese, Garlic'),
('four_cheese', 'The Four Cheese Pizza', 'Veggie', 'Ricotta Cheese, Gorgonzola Piccante Cheese, Mozzarella Cheese, Parmigiano Reggiano Cheese, Garlic'),
('green_garden', 'The Green Garden Pizza', 'Veggie', 'Spinach, Mushrooms, Tomatoes, Green Olives, Feta Cheese'),
('ital_veggie', 'The Italian Vegetables Pizza', 'Veggie', 'Eggplant, Artichokes, Tomatoes, Zucchini, Red Peppers, Garlic, Pesto Sauce'),
('mediterraneo', 'The Mediterranean Pizza', 'Veggie', 'Spinach, Artichokes, Kalamata Olives, Sun-dried Tomatoes, Feta Cheese, Plum Tomatoes, Red Onions'),
('mexicana', 'The Mexicana Pizza', 'Veggie', 'Tomatoes, Red Peppers, Jalapeno Peppers, Red Onions, Cilantro, Corn, Chipotle Sauce, Garlic'),
('spin_pesto', 'The Spinach Pesto Pizza', 'Veggie', 'Spinach, Artichokes, Tomatoes, Sun-dried Tomatoes, Garlic, Pesto Sauce'),
('spinach_fet', 'The Spinach and Feta Pizza', 'Veggie', 'Spinach, Mushrooms, Red Onions, Feta Cheese, Garlic'),
('veggie_veg', 'The Vegetables + Vegetables Pizza', 'Veggie', 'Mushrooms, Tomatoes, Red Peppers, Green Peppers, Red Onions, Zucchini, Spinach, Garlic');


show tables;

select * from pizza_types;


-- 1. Retrieve the total number of orders placed.
select Count(order_id) total_orders from orders;

-- 2. Calculate the total revenue generated from pizza sales.

select * from pizzas;
select * from order_details;

SELECT 
    ROUND(SUM(Total_price), 2)
FROM
    (SELECT 
        SUM(p.price * od.quantity) Total_price
    FROM
        pizzas p
    JOIN order_details od ON p.pizza_id = od.pizza_id) r;
        
        
-- OR 

SELECT 
    ROUND(SUM(p.price * od.quantity)) Total_price
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id;

-- 3. Identify the highest-priced pizza.
select * from pizzas;

select * from pizza_types;

SELECT 
    pt.name, p.price
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
ORDER BY price DESC
LIMIT 1;

-- 4. Identify the most common pizza size ordered.

SELECT 
    p.size, COUNT(quantity) q
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY q DESC
LIMIT 1;

-- 5. List the top 5 most ordered pizza types along with their quantities.

SELECT 
    name, SUM(quantity) total_sold
FROM
    pizza_types pt
        JOIN
    pizzas p ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY name
ORDER BY total_sold DESC
LIMIT 5;


-- Intermediate
-- 1. Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    category, SUM(quantity) qty
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY category
ORDER BY qty DESC;

-- 2. Determine the distribution of orders by hour of the day.

SELECT 
    EXTRACT(HOUR FROM order_time) hr,
    COUNT(EXTRACT(HOUR FROM order_time)) cnt
FROM
    orders
GROUP BY hr
ORDER BY cnt DESC;

-- 3. Join relevant tables to find the category-wise distribution of pizzas.


SELECT 
    pt.category, sum(od.quantity) as sum
FROM
    pizzas AS p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_Details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category; 
 

-- 4. Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    AVG(qty)
FROM
    (SELECT 
        EXTRACT(DAY FROM o.order_date) day, sum(od.quantity) qty
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY day
    ORDER BY day) t;

SELECT 
        EXTRACT(DAY FROM o.order_date) day, sum(od.quantity) qty
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY day
    ORDER BY day;
    

-- 5. Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name, SUM(od.quantity * p.price) total_price
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_price DESC
LIMIT 3;


/* Advanced:
Calculate the percentage contribution of each pizza type to total revenue.
Analyze the cumulative revenue generated over time.
Determine the top 3 most ordered pizza types based on revenue for each pizza category. */

-- 1. Calculate the percentage contribution of each pizza type to total revenue.

with total_revenue as (
		SELECT 
			ROUND(SUM(p.price * od.quantity)) Total_price
		FROM
			pizzas p
				JOIN
			order_details od ON p.pizza_id = od.pizza_id
            ),
per_pizza_contribution as (
		SELECT 
			pt.name, ROUND(SUM(od.quantity * p.price)) tc
		FROM
			pizzas p
				JOIN
			order_details od ON p.pizza_id = od.pizza_id
				JOIN
			pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
		GROUP BY pt.name
        )
        
select name, round((tc / total_price)*100) per_contribution
from per_pizza_contribution ppc 
join total_revenue tr
order by per_contribution desc;
 
 
-- OR finding percentage contribution with category

with total_revenue as (
		SELECT 
			ROUND(SUM(p.price * od.quantity)) Total_price
		FROM
			pizzas p
				JOIN
			order_details od ON p.pizza_id = od.pizza_id
            ),
per_pizza_contribution as (
		SELECT 
			pt.category, ROUND(SUM(od.quantity * p.price)) tc
		FROM
			pizzas p
				JOIN
			order_details od ON p.pizza_id = od.pizza_id
				JOIN
			pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
		GROUP BY pt.category
        )
        
select category, round((tc / total_price)*100, 2) per_contribution
from per_pizza_contribution ppc 
join total_revenue tr
order by per_contribution desc;


-- 2. Analyze the cumulative revenue generated over time.

select order_date, round(sum(price) over (order by order_date)) as revenue
from (
		SELECT 
			order_date, ROUND(SUM(od.quantity * p.price), 2) AS price
		FROM
			order_details od
				JOIN
			orders o ON od.order_id = o.order_id
				JOIN
			pizzas p ON od.pizza_id = p.pizza_id
		GROUP BY order_date
        ) t;


-- 3. Determine the top 3 most ordered pizza types based on revenue for each pizza category. */

      
select category, name, total, rn from       
			(select category, name, total,
			rank() over(partition by category order by total desc) as rn
			from
			(
			SELECT 
				pt.category,
				pt.name,
				round(SUM(od.quantity * p.price)) AS total
			FROM
				pizza_types pt
					JOIN
				pizzas p ON pt.pizza_type_id = p.pizza_type_id
					JOIN
				order_details od ON od.pizza_id = p.pizza_id
			GROUP BY pt.category , pt.name
			) as a) b
where rn <= 3;
