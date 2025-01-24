use  oe;
-- Вывести имя, фамилию покупателей и даты их заказов(order_date)
SELECT 
    
CUST_FIRST_NAME, 
   CUST_LAST_NAME, 
 ORDER_DATE
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id;
    
    
  --  Вывести даты заказов продуктов и описание этих продуктов(product_description).
SELECT 
    o.order_date , 
    product_description 
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    product_information p ON oi.product_id = p.product_id;
    
    
    -- Вывести имя, фамилию покупателей, даты заказов(orderdate), описание продуктов,
    --  которые они заказали и категории 
    -- соответствующих продуктов (categoryname).
    
    
    SELECT 
   CUST_FIRST_NAME, 
   CUST_LAST_NAME,
    order_date ,
    p.product_description,
    cat.category_name 
FROM
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    product_information p ON oi.product_id = p.product_id
JOIN 
    categories_tab cat ON p.category_id = cat.category_id;
    
    
  --  Вывести названия(productname), описания категорий(categorydescription) и 
  -- количества(quantity) тех продуктов, у которых минимальная стоимость (min_price) больше 300.


SELECT 
    p.product_name ,
    category_description ,
    oi.quantity AS Quantity
FROM 
    product_information p
JOIN 
    categories_tab cat ON p.category_id = cat.category_id
JOIN 
    order_items oi ON p.product_id = oi.product_id
WHERE 
    p.min_price > 300;
    
    -- Вывести имя, фамилию всех женатых мужчин покупателей, 
    -- которые купили продукты со стоимостью (list_price) больше 550.
    
    
    
    SELECT 
    c.CUST_FIRST_NAME AS name, 
    c.CUST_LAST_NAME AS surname
FROM 
    customers c
JOIN 
    orders o ON c.CUSTOMER_ID = o.CUSTOMER_ID
JOIN 
    order_items oi ON o.ORDER_ID = oi.ORDER_ID
JOIN 
    product_information p ON oi.PRODUCT_ID = p.PRODUCT_ID
WHERE 
    c.GENDER = 'M' 
    AND c.MARITAL_STATUS = 'married' 
    AND p.LIST_PRICE > 550;
    
    SELECT * FROM customers;
    
    
    -- Вывести те продукты(productname), которых нет в заказанных (таблица orderitems).
SELECT 
    p.PRODUCT_NAME AS product_name
FROM 
    product_information p
LEFT JOIN 
    order_items oi ON p.PRODUCT_ID = oi.PRODUCT_ID
WHERE 
    oi.PRODUCT_ID IS NULL;
    
    -- Вывести покупателей(custfirstname, custlastname), которые ничего не заказали (таблица orders).
SELECT 
    c.CUST_FIRST_NAME AS custfirstname, 
    c.CUST_LAST_NAME AS custlastname
FROM 
    customers c
LEFT JOIN 
    orders o ON c.CUSTOMER_ID = o.CUSTOMER_ID
WHERE 
    o.ORDER_ID IS NULL;