---1.	BASIC: GET ALL ORDERS WITH STATUS PENDING

    SELECT 
    OrderID,
    CustomerID,
   



     RestaurantID,
    OrderDate,
    Status,
    TotalAmount
    FROM Orders
    WHERE Status = 'Pending';
---2.	DETAILED: JOIN WITH CUSTOMERS AND REATAURANTS

   SELECT
 o.OrderID,
o.OrderDate,
o.Status,
o.TotalAmount,
c.FullName AS CustomerName,
c.PhoneNumber,
r.Name AS RestaurantName,
r.Location,
o.DeliveryMethod,
o.EstimatedDeliveryTime
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
WHERE o.Status = 'Pending'
ORDER BY o.OrderDate DESC;


---3.OPTIONAL: FILTER BY TODAY PENDING ORDER ONLY


SELECT
o.OrderID,
c.FullName AS Customer,
r.Name AS Restaurant,
o.OrderDate,
o.EstimatedDeliveryTime,
o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
WHERE o.Status = 'Pending'
AND DATE(o.OrderDate) = CURDATE();








--4.PENDING ORDERS QUERY(WITH CUSTOMERS AND RESTAURANTS INFO)

SELECT o.OrderID,o.OrderDate,o.EstimatedDeliveryTime,
o.Status,o.TotalAmount,o.PaymentMethod,o.DeliveryMethod,
o.Notes,c.FullName AS CustomerName,
c.PhoneNumber,c.City,r.Name AS RestaurantName,
r.Location AS RestaurantLocation
FROM Orders oJOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
WHERE o.Status = 'Pending'
ORDER BY o.OrderDate DESC;
