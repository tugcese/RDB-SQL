--- 0.20 VALUE - 0.05 VALUE

WITH t1 AS(
           SELECT DISTINCT product_id, discount, 
                    SUM(quantity) OVER(PARTITION BY product_id, discount) total_order
           FROM sale.order_item),
t2 as (SELECT *, 
       FIRST_VALUE(total_order) over(PARTITION by product_id ORDER BY product_id, discount) first, 
       LAST_VALUE(total_order) over(PARTITION by product_id order by product_id, discount ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last
       FROM t1) 
SELECT DISTINCT product_id,
        CASE WHEN last - first > 0 THEN 'Positive'
             WHEN last - first = 0 THEN 'Neutral'
             WHEN last - first < 0 THEN 'Negative'
        END Discount_Effect
FROM t2
ORDER BY product_id


----- CALCULATE WITH FOUND AVG DISCOUNT FOR PER ITEM--

WITH t1 AS(SELECT DISTINCT product_id, discount, 
           SUM(quantity) OVER(PARTITION BY product_id, discount) total_order
           FROM sale.order_item
           ),
t2 AS(SELECT *,
      SUM(discount*total_order) OVER(PARTITION BY product_id)/SUM(total_order) OVER(PARTITION BY product_id) total_for_one
      FROM t1)

SELECT DISTINCT product_id,
    CASE WHEN total_for_one >= 0.05 and total_for_one < 0.10 THEN 'Positive'
         WHEN total_for_one <= 0.15 and total_for_one >= 0.10 THEN 'Neutral'
         WHEN total_for_one > 0.15 THEN 'Negative' 
         END discount_effect
FROM t2 
ORDER BY product_id