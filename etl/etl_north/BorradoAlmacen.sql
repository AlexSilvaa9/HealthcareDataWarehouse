USE [NorthwindDW]
GO
/****** Object:  StoredProcedure [dbo].[BorrarAlmacen]    Script Date: 04/12/2024 11:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BorrarAlmacen] 
AS
BEGIN



	DELETE FROM Sales;
	DELETE FROM Product;
	DELETE FROM Category;
	DELETE FROM Time;
	DELETE FROM TempCities;
	DELETE FROM Supplier;
	DELETE FROM Customer;
	DELETE FROM Territories;
	DELETE FROM City;
	DELETE FROM State;
	DELETE FROM Country;
	DELETE FROM Continent;
	DELETE FROM Employee;
	DELETE FROM Shipper;
END
