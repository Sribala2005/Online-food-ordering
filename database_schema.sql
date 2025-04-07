---RESTAURANT TABLE

    CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Location VARCHAR(150),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    OpeningHours VARCHAR(100),
    Rating DECIMAL(2,1) DEFAULT 0.0,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
   




 UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE             CURRENT_TIMESTAMP
);

---MENUITEMS TABLE


     CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Category VARCHAR(50),
    IsVegetarian BOOLEAN DEFAULT FALSE,
    Availability BOOLEAN DEFAULT TRUE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE       CURRENT_TIMESTAMP,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID) ON DELETE CASCADE
);

 ---CUSTOMERS TABLE

    CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    AddressLine1 VARCHAR(150),
    AddressLine2 VARCHAR(150),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE    CURRENT_TIMESTAMP
)

---ORDERS TABLE

    CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    RestaurantID INT NOT NULL,
   


 OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    EstimatedDeliveryTime DATETIME,
    DeliveryMethod ENUM('Pickup', 'Delivery') DEFAULT 'Delivery',
    Status ENUM('Pending', 'Confirmed', 'Preparing', 'Ready', 'Out for Delivery', 'Delivered',  'Cancelled') DEFAULT 'Pending',
    PaymentMethod ENUM('Cash', 'Card', 'UPI', 'Wallet') DEFAULT 'Cash',
    SubTotal DECIMAL(10,2) NOT NULL CHECK (SubTotal >= 0),
    TaxAmount DECIMAL(10,2) DEFAULT 0.00 CHECK (TaxAmount >= 0),
    DeliveryFee DECIMAL(10,2) DEFAULT 0.00 CHECK (DeliveryFee >= 0),
    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),
    DeliveryAddress TEXT,
    Notes TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE     CURRENT_TIMESTAMP,
    
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID) ON DELETE CASCADE
)
---ORDER ITEMS TABLE


    CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT DEFAULT 1 CHECK (Quantity > 0),
    ItemPrice DECIMAL(10,2) NOT NULL CHECK (ItemPrice >= 0), -- Price at the time of order
    TotalPrice DECIMAL(10,2) GENERATED ALWAYS AS (Quantity * ItemPrice) STORED, -- Calculated
    SpecialRequest TEXT,
    IsReplacementAllowed BOOLEAN DEFAULT FALSE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID) ON DELETE CASCADE
);
 
