--Drop Tables if exists
Drop table if EXISTS Customers;
Drop Table if EXISTS Products;
Drop Table if EXISTS Sales_Reps;
Drop Table if EXISTS Orders;
Drop Table if EXISTS Order_Details;

--1. Customers Master Table

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
('C001', 'Adhik Kadam', 'adhik.kadam@gmail.com', 'Pune'),
('C002', 'Deepak Mehta', 'deepakm@gmail.com', 'Mumbai'),
('C003', 'Bala R', 'balasubramaniyam@gmail.com', 'Pune'),
('C004', 'Sagar Rahate', 'sagar2385@outlook.com', 'Mumbai'),
('C005', 'Varsha Kamble', 'varsha.kamble8@hotmail.com', 'Satara');


--2. Product Master Table

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products VALUES
('P001', 'Laptop', 'Electronics', 800.00),
('P002', 'Smartphone', 'Electronics', 500.00),
('P003', 'Headphones', 'Accessories', 50.00),
('P004', 'Keyboard', 'Accessories', 30.00),
('P005', 'Mouse', 'Accessories', 20.00);


--3. Sales Representative Master Table

CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);

INSERT INTO Sales_Reps VALUES
('S001', 'Kumar Verma', 'East'),
('S002', 'Nitesh Rathod', 'West'),
('S003', 'Roland Fernandis', 'North'),
('S004', 'Amol Kulkarni', 'South'),
('S005', 'Bhushan Satpute', 'Central');


--4. Orders Master Table

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

INSERT INTO Orders VALUES
('ORD001', 'C001', 'S001', '2026-03-10'),
('ORD002', 'C002', 'S002', '2026-03-11'),
('ORD003', 'C003', 'S003', '2026-03-12'),
('ORD004', 'C004', 'S004', '2026-03-13'),
('ORD005', 'C005', 'S005', '2026-03-14');

 
--5. Order Details Table

CREATE TABLE Order_Details (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,

    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Details VALUES
('ORD001', 'P001', 1),
('ORD002', 'P002', 2),
('ORD003', 'P003', 3),
('ORD004', 'P004', 1),
('ORD005', 'P005', 4);

Select * from Customers;
Select * from Products;
Select * from Sales_Reps;
Select * from Orders;
Select * from Order_Details;