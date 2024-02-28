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
Show the first_name, last_name. hire_date of the most recently hired employee.
*/
select
  first_name,
  last_name,
  MAX(hire_date)
from employees


/* EASY

*/







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


/*

*/
