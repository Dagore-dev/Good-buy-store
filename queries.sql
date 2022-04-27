-- Number of customers
SELECT 
  COUNT(CUSTOMERID) AS Numero_de_clientes
FROM customer;

-- Number of sellers
SELECT 
  COUNT(SELLERID) 
FROM seller;

-- Seniors sellers with their juniors in charge
SELECT
    senior.name AS senior,
    junior.name AS junior
FROM seller senior
INNER JOIN seller junior
    ON senior.sellerid = junior.seller_sellerid
ORDER BY senior.name;

-- Products with its supplier
SELECT 
	PRODUCTID,	
  BRAND,	
  TYPE,	
  MODEL,	
  WEIGHT,	
  PURCHASEPRICE,	
  SALEPRICE,	
  STOCK,	
  SUPPLIERID,
	NAME AS SUPPLIER
FROM product 
JOIN supplier 
 ON SUPPLIER_SUPPLIERID = SUPPLIERID;
 
-- Supplier with the list of products of each one (comma separated)
SELECT
  NAME AS Proveedor,
  LISTAGG(MODEL,', ') AS productos
FROM SUPPLIER
JOIN product
  ON SUPPLIER_SUPPLIERID = SUPPLIERID 
GROUP BY NAME;

-- Products of one range (for instance 'GR')
SELECT 
  * 
FROM product 
WHERE
  TYPE LIKE 'GR';

-- Products related to one product (for instance 'Bosch TAT3A004')
SELECT 
  * 
FROM product
JOIN relatedto
  ON PRODUCTID=PRODUCT_PRODUCTID
WHERE 
  MODEL LIKE 'Bosch TAT3A004';

-- Products which model starts with 'R'
SELECT 
  * 
FROM product
WHERE
  MODEL LIKE '%R';

-- Purchases with the name of the seller (for instance sellerid = 1)
SELECT 
  * 
FROM PURCHASE
JOIN seller
  ON SELLERID = PURCHASE.SELLER_SELLERID
WHERE 
  SELLERID = 1;

-- Products with its price and quantity from one purcharse (for instance purcharse with purchaseid = 2)
SELECT 
  MODEL,
  contains.SALEPRICE,
  QUANTITY
FROM contains
JOIN product
  ON PRODUCTID=PRODUCT_PRODUCTID
WHERE 
  PURCHASE_PURCHASEID=2;

-- Purchases with total price
SELECT 
  PURCHASEID,
  SUM(SALEPRICE*QUANTITY)
FROM contains
JOIN purchase
  ON PURCHASE_PURCHASEID=PURCHASEID
GROUP BY PURCHASEID;

-- Average spending in purchases
SELECT
  AVG(SALEPRICE*QUANTITY)
FROM contains
JOIN purchase
  ON PURCHASE_PURCHASEID=PURCHASEID;
