/****** Object:  Database [CarSalesDB]    Script Date: 2019-07-14 11:53:00 AM ******/

--CREATE DATABASE CarSalesDB

USE CarSalesDB;

DROP TABLE IF EXISTS dbo.Customers;
DROP TABLE IF EXISTS dbo.Orders;

CREATE TABLE [dbo].[Customers](
	[CustName] [nvarchar](100) NOT NULL PRIMARY KEY,
	[Address] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar] (100) NOT NULL);

CREATE TABLE [dbo].[Orders](
	[OrderId] int IDENTITY(1,1) PRIMARY KEY,
	CustName nvarchar(100) FOREIGN KEY REFERENCES Customers(CustName),
	[Brand] [nvarchar](100) NOT NULL,
	[Model] [nvarchar](200) NULL,
	[Year] [nvarchar](4) NULL,
	[Colour] [nvarchar](50) NULL,
	[Price] [float] NULL);


INSERT INTO Customers
VALUES 
('Hyunju','1235 Marlborough Court, Oakville', 'L6H 0W8', '(437)988-7778', 'woohyu@sheridancollege.ca','1234');

INSERT INTO Customers
VALUES 
('woo','1410 Trafalgar Road, Oakville', 'L6H 0W8', '(111)222-3333', 'woo@sheridancollege.ca','1234');

INSERT INTO Orders(CustName, Brand,Model,Year,Colour,Price)
VALUES
('Hyunju', 'Ferrari', '488 Spider', '2019', 'Red', 334409);

SELECT * FROM Customers;
SELECT * FROM Orders;