﻿CREATE TABLE Orders (
	[OrderId] INT Identity NOT NULL,
	[Name] NVARCHAR(MAX) NULL,
	[Line1] NVARCHAR(MAX) NULL,
	[City] NVARCHAR(MAX) NULL,
	[Dispatched] BIT NOT NULL,
	CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED ([OrderId] ASC)
);

CREATE TABLE OrderLines (
	[OrderLineId] INT IDENTITY NOT NULL,
	[Quantity] INT NOT NULL,
	[Book_BookID] INT NULL,
	[Order_OrderId] INT NULL,
	CONSTRAINT [PK_dbo.OrderLines] PRIMARY KEY CLUSTERED ([OrderLineId] ASC),
	CONSTRAINT [FK_dbo.OrderLines_dbo.Books_BookID] FOREIGN KEY
		([Book_BookID]) REFERENCES [dbo].[Books] ([BookID]),
	CONSTRAINT [FK_dbo.OrderLines_dbo.Order_OrderId] FOREIGN KEY
		([Order_OrderId]) REFERENCES [dbo].[Orders] ([OrderId])
);