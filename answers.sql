-- Question 1 Achieving 1NF (First Normal Form) 🛠️

-- Split multi-value Products column into atomic values
SELECT 
  OrderID,
  CustomerName,
  TRIM(value) AS Product  -- Trim whitespace from split values
FROM ProductDetail
CROSS APPLY STRING_SPLIT(Products, ',');  -- Split comma-separated products

-- Question 2 Achieving 2NF (Second Normal Form) 🧩

-- Create Orders table (removes partial dependency)
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(255)
);

-- Create OrderProducts table (full dependency on composite PK)
CREATE TABLE OrderProducts (
  OrderID INT,
  Product VARCHAR(255),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
