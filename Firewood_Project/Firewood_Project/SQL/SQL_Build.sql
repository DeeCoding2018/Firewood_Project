-- Script to build the table system from scratch
-- Initial drops clear all existing tables on this type.
DROP TABLE IF EXISTS Order_Details
DROP TABLE IF EXISTS Products
DROP TABLE IF EXISTS Orders
DROP TABLE IF EXISTS Customer
DROP TABLE IF EXISTS Account_Information
DROP TABLE IF EXISTS Employee
DROP TABLE IF EXISTS Products
DROP TABLE IF EXISTS Category

-- Builds Account_Information
CREATE TABLE [dbo].Account_Information
(
	[Account_Number] INT NOT NULL PRIMARY KEY IDENTITY,
	[User_Name] NCHAR(10) NOT NULL,
	[Password] NCHAR(20) NOT NULL
)

go

-- Builds Customer 
CREATE TABLE [dbo].Customer (
    [Customer_Id] INT NOT NULL IDENTITY,
    [Account_Number] INT NOT NULL, 
    [First_Name] NCHAR(10) NOT NULL, 
    [Last_Name] NCHAR(10) NOT NULL, 
    [Zip_Code] NCHAR(10) NOT NULL, 
    [Phone_Number] NCHAR(10) NOT NULL, 
    [Email_Address] NCHAR(10) NOT NULL,
	-- SETS Primary Key
    CONSTRAINT [PK_Customer] PRIMARY KEY ([Customer_Id]), 
	-- SETS Foreign Key
    CONSTRAINT [FK_Customer_To_Account_Information] FOREIGN KEY ([Customer_Id]) REFERENCES [Account_Information]([Account_Number])
)

go

-- Builds Employee
CREATE TABLE [dbo].Employee
(
	-- Sets Primary Key inline
	[Employee_Id] INT NOT NULL PRIMARY KEY,
	[First_Name] NCHAR(20) NOT NULL,
	[Last_Name] NCHAR(20) NOT NULL,
	[Phone_Number] NCHAR(10) NOT NULL, 
    [Email_Address] NCHAR(10) NOT NULL 
)

go

-- Creates Orders
CREATE TABLE [dbo].Orders
(
	-- Sets Primary Key
	[Order_Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Customer_Id] INT NOT NULL, 
    [Employee_Id] INT NOT NULL, 
    [Order_Date] DATE NOT NULL, 
    [Shipped_Date] DATE NOT NULL, 
    [Shipping_Address] NCHAR(50) NULL, 
    [City] NCHAR(25) NULL, 
    [State] NCHAR(25) NULL, 
    [Zip_Code] NCHAR(10) NULL,
	-- Sets Foreign Keys
	CONSTRAINT [FK_Orders_To_Customer] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Customer_Id]),
	CONSTRAINT [FK_Orders_To_Employee] FOREIGN KEY ([Employee_Id]) REFERENCES [Employee]([Employee_Id])
)

go

-- Create Category
CREATE TABLE [dbo].Category
(
	[Category_Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Category_Name] NVARCHAR(25) NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	[Picture] NVARCHAR(50) NOT NULL
)

-- Create Products
CREATE TABLE [dbo].Products
(
	[Product_Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Category_Id] INT NOT NULL,
	[Product_Name] NVARCHAR(15),
	[Price] MONEY
)

-- Alters Products
ALTER TABLE [dbo].Products
	-- Adds Foreign Key
	ADD CONSTRAINT [FK_Products_To_Category]
		FOREIGN KEY ([Category_Id]) REFERENCES Category([Category_Id]);

go

-- Create Order_Details
CREATE TABLE [dbo].Order_Details
(
	[Order_Id] INT NOT NULL,
	[Product_ID] INT NOT NULL,
	[Unit_Price] MONEY NOT NULL,
	[Quantity] INT NOT NULL
)

-- Alter Order_Details
ALTER TABLE [dbo].Order_Details
	-- Adds Primary Key
	ADD CONSTRAINT [PK_Order_Details_To_Orders_And_To_Products] PRIMARY KEY ([Order_Id],[Product_Id])

-- Alter Order_Details
ALTER TABLE [dbo].Order_Details
	-- Adds Primary Key
	ADD CONSTRAINT [FK_Order_Details_To_Orders] FOREIGN KEY ([Order_Id]) REFERENCES Orders([Order_Id])

-- Alter Order_Details
ALTER TABLE [dbo].Order_Details
	-- Adds Primary Key
	ADD CONSTRAINT [FK_Order_Details_To_Products] FOREIGN KEY ([Product_Id]) REFERENCES Products([Product_Id])