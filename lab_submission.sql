-- (i) A Procedure called PROC_LAB5
DELIMITER//
CREATE PROCEDURE PROC_LAB5()
BEGIN
    SELECT customers.customerName, orders.orderNumber, orders.orderDate
    FROM customers
    JOIN orders ON customers.customerNumber = orders.customerNumber;
END$$
DELIMITER ;


-- (ii) A Function called FUNC_LAB5
DELIMITER //
CREATE FUNCTION FUNC_LAB5(order_id INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);
    -- Calculates total order value for a specific order ID
    SET total = (SELECT SUM(priceEach * quantityOrdered)
                 FROM orderdetails
                 WHERE orderNumber = order_id);
    RETURN total;
END$$
DELIMITER ;


-- (iii) A View called VIEW_LAB5
CREATE VIEW VIEW_LAB5 AS
SELECT customers.customerName, orders.orderNumber, FUNC_LAB5(orders.orderNumber) AS totalOrderValue
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber;