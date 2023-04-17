USE homework1;
CREATE TABLE sales(
	id SERIAL PRIMARY KEY, 			-- SERIAL = BIGINT NOT NULL AI UNIQUE 
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);


SELECT * FROM sales;

ALTER TABLE sales
ADD COLUMN order_type VARCHAR (50) NOT NULL;

SELECT * FROM sales;

ALTER TABLE sales DROP COLUMN order_type;
SELECT * FROM sales;

SHOW CREATE TABLE sales;

SELECT id, count_product,
	CASE
		WHEN count_product < 100 THEN 'Маленький заказ'
        WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
        WHEN count_product > 300 THEN 'Большой заказ'
        ELSE 'Не понятный заказ'
	END AS 'Тип  заказа'
FROM sales;


CREATE TABLE orders(
id SERIAL PRIMARY KEY,
employee_id VARCHAR  (50) NOT NULL,
amout  DECIMAL (2) NOT NULL,
order_status VARCHAr (50)
);

ALTER TABLE orders RENAME COLUMN amout TO amount;
ALTER TABLE orders MODIFY amount DECIMAL (6,2);  


INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', '15.00', 'OPEN'),
('e01', '25.50', 'OPEN'),
('e05', '100.70', 'CLOSED'),
('e02', '22.18', 'OPEN'),
('e04', '9.50', 'CANCELLED');


SELECT * FROM orders;
TRUNCATE TABLE orders;
SELECT * FROM orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', '15.00', 'OPEN'),
('e01', '25.50', 'OPEN'),
('e05', '100.70', 'CLOSED'),
('e02', '22.18', 'OPEN'),
('e04', '9.50', 'CANCELLED');

SELECT * FROM orders;

SELECT
id AS 'Номер заказа',
employee_id AS 'Номер сотрудника',
amount AS 'Сумма заказа',
order_status AS 'Статус заказа',
IF (order_status = 'OPEN', 'Order is in open state',
IF (order_status = 'CLOSED', 'Order is closed',
IF (order_status = 'CANCELLED', 'Order is cancelled', 'Not defined') 
))
AS 'full_order_status'
FROM orders;
