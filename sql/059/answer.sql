-- Q1
ALTER TABLE Orders ADD PRIMARY KEY (OrderID);

ALTER TABLE Customers ADD PRIMARY KEY (CustomerID);

ALTER TABLE Products ADD PRIMARY KEY (ProductID);

-- Q2
ALTER TABLE Orders ADD CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID);

ALTER TABLE Orders ADD CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES Products (ProductID);

-- Q3
CREATE INDEX idx_orderdate ON Orders (OrderDate);
