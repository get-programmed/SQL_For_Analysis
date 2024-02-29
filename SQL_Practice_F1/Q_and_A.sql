/* EASY
Show the category_name and description from the categories table sorted by category_name.
*/
SELECT category_name, description
FROM categories
ORDER BY category_name;


/* EASY
Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'
*/
select
  contact_name,
  address,
  city
from customers
where
  country NOT IN ('Germany', 'Mexico', 'Spain')


/* EASY
Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26
*/
select
  order_date,
  shipped_date,
  customer_id,
  freight
from orders
where order_date = '2018-02-26'


/* EASY
Show the employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date
*/
select
  employee_id,
  order_id,
  customer_id,
  required_date,
  shipped_date
from orders
where shipped_date > required_date


/* EASY
Show all the even numbered Order_id from the orders table
*/
select order_id
from orders
where order_id % 2 = 0
---------------------------
SELECT order_id
FROM orders
WHERE mod(order_id,2)=0;


/* EASY
Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name
*/
select
  city,
  company_name,
  contact_name
from customers
where city LIKE '%L%'
order by contact_name


/* EASY
Show the company_name, contact_name, fax number of all customers that has a fax number. (not null)
*/
select
  company_name,
  contact_name,
  fax
from customers
where fax IS NOT NULL


/* EASY
Show the first_name, last_name. hire_date of the most recently hired employee.
*/
select
  first_name,
  last_name,
  MAX(hire_date)
from employees


/* EASY
Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.
*/
select
  round(avg(unit_price), 2) AS Average_Price,
  Sum(units_in_stock) AS Unit_Stock,
  Sum(discontinued) AS Discount
from products


/* MEDIUM
Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table
*/
select
  p.product_name,
  s.company_name,
  c.category_name
from products AS p
  join categories AS c ON c.category_id = p.category_id
  join suppliers AS s ON s.supplier_id = p.supplier_id


/* MEDIUM
Show the category_name and the average product unit price for each category rounded to 2 decimal places.
*/
select
  c.category_name AS Category_Name,
  ROUND(avg(unit_price), 2) AS Average_Unit_Price
FROM categories as c
  join products AS p on c.category_id = p.category_id
group by Category_Name


/* MEDIUM
Show the city, company_name, contact_name from the customers and suppliers table merged together.
Create a column which contains 'customers' or 'suppliers' depending on the table it came from.
*/
select
  city,
  company_name,
  contact_name,
  'customers'
from customers
union
select
  city,
  company_name,
  contact_name,
  'suppliers'
from suppliers


/* HARD
Show the employee's first_name and last_name, a "num_orders" column with a count of the orders taken, and a column called "Shipped" that displays "On Time" if the order shipped_date is less or equal to the required_date, "Late" if the order shipped late.

Order by employee last_name, then by first_name, and then descending by number of orders.
*/
select
  e.first_name,
  e.last_name,
  count(o.order_id) AS num_orders,
  (
    case
      WHEN o.shipped_date <= o.required_date THEN 'On Time'
      ELSE 'Late'
    END
  ) AS Shipped
from employees as e
  join orders AS o ON e.employee_id = o.employee_id
group by
  first_name,
  last_name,
  Shipped
order by
  last_name,
  first_name,
  num_orders desc


/* HARD
Show how much money the company lost due to giving discounts each year, order the years from most recent to least recent. Round to 2 decimal places
*/
select
  year(o.order_date) AS Order_Year,
  round(
    SUm(p.unit_price * od.quantity * od.discount),
    2
  ) AS Discount_Ammount
from orders AS o
  join order_details AS od ON o.order_id = od.order_id
  join products AS p ON p.product_id = od.product_id
group by Order_Year
order by Order_Year desc
