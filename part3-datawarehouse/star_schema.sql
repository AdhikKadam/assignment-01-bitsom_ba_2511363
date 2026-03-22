-- Star Schema for Retail Data Warehouse

-- Dimension Tables

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT,
    quarter INT
);

CREATE TABLE dim_store (
    store_key INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_key INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table

CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_key INT,
    store_key INT,
    product_key INT,
    customer_id VARCHAR(20),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(15,2),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);

-- Insert Dimension Data (cleaned and standardized)

-- dim_date
INSERT INTO dim_date (date_key, full_date, year, month, day, quarter) VALUES
(20230829, '2023-08-29', 2023, 8, 29, 3),
(20231212, '2023-12-12', 2023, 12, 12, 4),
(20230205, '2023-02-05', 2023, 2, 5, 1),
(20230220, '2023-02-20', 2023, 2, 20, 1),
(20230115, '2023-01-15', 2023, 1, 15, 1),
(20230809, '2023-08-09', 2023, 8, 9, 3),
(20230331, '2023-03-31', 2023, 3, 31, 1),
(20231026, '2023-10-26', 2023, 10, 26, 4),
(20231208, '2023-12-08', 2023, 12, 8, 4),
(20230815, '2023-08-15', 2023, 8, 15, 3);

-- dim_store
INSERT INTO dim_store (store_name, store_city) VALUES
('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune'),
('Mumbai Central', 'Mumbai');

-- dim_product
INSERT INTO dim_product (product_name, category) VALUES
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Smartwatch', 'Electronics'),
('Atta 10kg', 'Groceries'),
('Jeans', 'Clothing'),
('Biscuits', 'Groceries'),
('Jacket', 'Clothing'),
('Laptop', 'Electronics'),
('Milk 1L', 'Groceries');

-- Insert Fact Data (cleaned sample data, at least 10 rows)

INSERT INTO fact_sales (transaction_id, date_key, store_key, product_key, customer_id, units_sold, unit_price, total_amount) VALUES
('TXN5000', 20230829, 1, 1, 'CUST045', 3, 49262.78, 147788.34),
('TXN5001', 20231212, 1, 2, 'CUST021', 11, 23226.12, 255487.32),
('TXN5002', 20230205, 1, 3, 'CUST019', 20, 48703.39, 974067.80),
('TXN5003', 20230220, 2, 2, 'CUST007', 14, 23226.12, 325165.68),
('TXN5004', 20230115, 1, 4, 'CUST004', 10, 58851.01, 588510.10),
('TXN5005', 20230809, 3, 5, 'CUST027', 12, 52464.00, 629568.00),
('TXN5006', 20230331, 4, 4, 'CUST025', 6, 58851.01, 353106.06),
('TXN5007', 20231026, 4, 6, 'CUST041', 16, 2317.47, 37079.52),
('TXN5008', 20231208, 3, 7, 'CUST030', 9, 27469.99, 247229.91),
('TXN5009', 20230815, 3, 4, 'CUST020', 3, 58851.01, 176553.03);
