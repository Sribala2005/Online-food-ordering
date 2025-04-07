---1.REATAURANT TABLE

INSERT INTO Restaurants (Name, Description, Location, ContactNumber, Email, OpeningHours, Rating)
VALUES
('Spicy Garden', 'Authentic Indian Cuisine', 'Hyderabad', '9876543210', 'spicy@garden.com', '10:00 AM - 10:00 PM', 4.5),
('Pizza World', 'Delicious Italian Pizzas', 'Mumbai', '9123456780', 'contact@pizzaworld.com', '11:00 AM - 11:00 PM', 4.2),
('Burger House', 'Best Burgers in Town', 'Delhi', '9988776655', 'hello@burgerhouse.com', '09:00 AM - 09:00 PM', 4.0),
('Vegan Delight', '100% Plant-Based Meals', 'Bangalore', '9001122334', 'info@vegandelight.com', '10:30 AM - 08:00 PM', 4.7),
('Tandoori Flames', 'Tandoori Specials & Kebabs', 'Chennai', '9345678901', 'support@tandooriflames.com', '12:00 PM - 12:00 AM', 4.3);

---2.MENU ITEMS TABLE

INSERT INTO MenuItems (RestaurantID, Name, Description, Price, Category, IsVegetarian)
VALUES
(1, 'Paneer Butter Masala', 'Creamy cottage cheese curry', 220.00, 'Main Course', TRUE),
(1, 'Chicken Biryani', 'Spicy Hyderabadi biryani', 250.00, 'Main Course', FALSE),
(2, 'Margherita Pizza', 'Classic cheese pizza', 180.00, 'Pizza', TRUE),
(3, 'Double Patty Burger', 'Beef burger with double patties', 200.00, 'Burgers', FALSE),
(4, 'Vegan Bowl', 'Quinoa, tofu and veggies', 210.00, 'Healthy', TRUE);


---4 CUSTOMERS TABLE

INSERT INTO Customers (FullName, Email, PhoneNumber, AddressLine1, AddressLine2, City, State, PostalCode)
VALUES
('Aman Verma', 'aman@example.com', '9898989898', '123 Street A', 'Near Market', 'Delhi', 'Delhi', '110001'),
('Sneha Rao', 'sneha@example.com', '9777788888', '456 Avenue B', NULL, 'Mumbai', 'Maharashtra', '400001'),



('Karthik Reddy', 'karthik@example.com', '9666677777', '789 Road C', 'Apt 101', 'Hyderabad', 'Telangana', '500001'),
('Neha Sharma', 'neha@example.com', '9555566666', '321 Colony D', NULL, 'Bangalore', 'Karnataka', '560001'),
('Ravi Kumar', 'ravi@example.com', '9444455555', '654 Lane E', 'Opp School', 'Chennai', 'Tamil Nadu', '600001');

---5.ORDER TABLE

INSERT INTO Orders (CustomerID, RestaurantID, EstimatedDeliveryTime, DeliveryMethod, Status, PaymentMethod, SubTotal, TaxAmount, DeliveryFee, TotalAmount, DeliveryAddress, Notes)
VALUES
(1, 1, NOW() + INTERVAL 45 MINUTE, 'Delivery', 'Preparing', 'UPI', 470.00, 47.00, 30.00, 547.00, '123 Street A, Delhi', 'Extra spicy'),
(2, 2, NOW() + INTERVAL 30 MINUTE, 'Pickup', 'Confirmed', 'Card', 180.00, 18.00, 0.00, 198.00, NULL, NULL),
(3, 3, NOW() + INTERVAL 50 MINUTE, 'Delivery', 'Pending', 'Cash', 200.00, 20.00, 20.00, 240.00, '789 Road C, Hyderabad', 'No onions'),
(4, 4, NOW() + INTERVAL 25 MINUTE, 'Pickup', 'Ready', 'Wallet', 210.00, 21.00, 0.00, 231.00, NULL, 'Pack it tight'),
(5, 5, NOW() + INTERVAL 60 MINUTE, 'Delivery', 'Out for Delivery', 'Card', 250.00, 25.00, 30.00, 305.00, '654 Lane E, Chennai', NULL);


---6.ORDER ITEMS TABLE

INSERT INTO OrderItems (OrderID, ItemID, Quantity, ItemPrice, SpecialRequest, IsReplacementAllowed)
VALUES
(1, 1, 1, 220.00, 'Extra gravy', FALSE),
(1, 2, 1, 250.00, 'Less spicy', TRUE),
(2, 3, 1, 180.00, NULL, FALSE),
(3, 4, 1, 200.00, 'No mayo', TRUE),
(4, 5, 1, 210.00, 'No tofu', FALSE);
