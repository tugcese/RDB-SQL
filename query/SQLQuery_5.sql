---- 1. List all the cities in the Texas and the numbers of customers in each city.----
SELECT city, COUNT(customer_id) FROM sale.customer WHERE [state] = 'TX' GROUP by city 

---- 2. List all the cities in the California which has more than 5 customer, by showing the cities which have more customers first.---
SELECT city, COUNT(customer_id) FROM sale.customer WHERE [state] = 'CA' GROUP by city HAVING COUNT(customer_id) > 5 


---- 3. List the top 10 most expensive products----
SELECT TOP 10 * FROM product.product ORDER by list_price DESC


---- 4. List store_id, product name and list price and the quantity of the products which are located in the store id 2 and the quantity is greater than 25----
SELECT product.stock.store_id, product.product.product_name, product.product.list_price, product.stock.quantity 
FROM product.stock 
INNER JOIN product.product on product.stock.product_id=product.product.product_id 
where store_id = 2 and quantity > 25 

---- 5. Find the sales order of the customers who lives in Boulder order by order date----
SELECT * FROM sale.customer 
INNER JOIN sale.orders on sale.customer.customer_id=sale.orders.customer_id 
WHERE city = 'Boulder' ORDER by order_date

---- 6. Get the sales by staffs and years using the AVG() aggregate function.
select *from sale.orders
select * from sale.order_item
SELECT sale.orders.staff_id, 
YEAR(sale.orders.order_date) as order_year, AVG((list_price*(1-discount))*quantity) as avg_amount
 FROM sale.orders 
INNER JOIN sale.order_item on sale.orders.order_id = sale.order_item.order_id 
GROUP BY staff_id , YEAR(order_date) ORDER by staff_id



---- 1. List all the cities in the Texas and the numbers of customers in each city.----


---- 2. List all the cities in the California which has more than 5 customer, by showing the cities which have more customers first.---


---- 3. List the top 10 most expensive products----



---- 4. List store_id, product name and list price and the quantity of the products which are located in the store id 2 and the quantity is greater than 25----


---- 5. Find the sales order of the customers who lives in Boulder order by order date----


---- 6. Get the sales by staffs and years using the AVG() aggregate function.


---- 7. What is the sales quantity of product according to the brands and sort them highest-lowest----


---- 8. What are the categories that each brand has?----


---- 9. Select the avg prices according to brands and categories----


---- 10. Select the annual amount of product produced according to brands----


---- 11. Select the store which has the most sales quantity in 2018.----


---- 12 Select the store which has the most sales amount in 2018.----


---- 13. Select the personnel which has the most sales amount in 2019.----
