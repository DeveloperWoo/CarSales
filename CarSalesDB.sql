/****** Object:  Database [CarSalesDB]    Script Date: 2019-07-14 11:53:00 AM ******/

CREATE DATABASE CarSalesDB

USE CarSalesDB;

DROP TABLE IF EXISTS dbo.Orders;
DROP TABLE IF EXISTS dbo.Customers;

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


INSERT INTO Customers(CustName, Address, PostalCode, PhoneNumber, Email, Password)
VALUES 
('HJ','2440 Winston Park Dr, Oakville', 'L6H 7V2', '(437)988-7778', 'woohyu@sheridancollege.ca','1234'),
('MJ','8200 Dixie Rd, Brampton', 'L6T 4B8', '(647)222-2644', 'parkminj@sheridancollege.ca','1234')
;

INSERT INTO Orders(CustName, Brand,Model,Year,Colour,Price)
VALUES
('HJ', 'Ferrari', '488 Spider', '2019', 'Red', 334409),
('MJ', 'Porsche', 'Macan', '2019', 'Blue', 400000)
;

SELECT * FROM Customers;
SELECT * FROM Orders;