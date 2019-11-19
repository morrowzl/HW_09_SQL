-- Instructions
-- Use the rental_db database that was created during exercise 1 of Unit 9.2

-- select * from actor
-- select * from staff
-- select * from customer
-- select * from customer_list

-- Create a view, called all_parties using UNION and write a PostgreSQL statement 
--   to return all of the actors, staff, and customers. Return the first_name and last_name columns 
--   from each of those tables and also indicate the type of record. 
--   (Hint: Hardcode the type of record in each of the queries that will be part of the union)

CREATE VIEW all_parties as
SELECT first_name AS first_name, last_name
FROM actor
UNION ALL
SELECT first_name AS first_name, last_name
FROM staff
union all
select first_name as first_name, last_name
from customer;

select count (first_name) from all_parties;

drop view all_parties

-- Use UNION to display from the tables customer and customer_list the ID of all customers who 
--   live in the city of London. Determine whether both tables contain the same customers by using UNION ALL. 
--   (Hint: Consider using subqueries or joins... either will work).

create view london_union_all as
select customer_id as cust_id
from customer

union all

select id
from customer_list
where city = 'London';

select * from london_union_all;
select count (cust_id) from london_union_all;
drop view london_union_all;
-- ------------------------------------------------------
create view london_union as
select customer_id as cust_id
from customer

union

select id
from customer_list
where city = 'London';

select * from london_union;
select count (cust_id) from london_union;
drop view london_union

