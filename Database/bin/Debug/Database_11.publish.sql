﻿/*
Deployment script for MtPhotos

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MtPhotos"
:setvar DefaultFilePrefix "MtPhotos"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering [dbo].[vwPhotosAndSales]...';


GO
ALTER VIEW [dbo].[vwPhotosAndSales]
	AS 


	SELECT
	
	NEWID() AS Id
	,  MtDbPhoto.Id AS MtDbPhotoId
	,  MtDbPhoto.DbName
	,  MtDbPhoto.ViewingCode
	,  MtDbPhoto.LargeImage
	,  MtDbPhoto.SmallImage
	,  MtDbPhoto.PayPalId
	,  MtDbPhoto.Width
	,  MtDbPhoto.MtDbFolderId
	,  MtDbFolder.PricePerPhoto
	,  MtDbPhoto.DbPath
	,  MtDbPhoto.DbShareUrl
	,  MtDbPhoto.TotalSold
	,  MtDbPhoto.TotalSales
	,  MtDbPhotoSale.SaleCode


	FROM MtDbPhoto
	INNER JOIN MtDbFolder ON MtDbFolder.Id = MtDbPhoto.MtDbFolderId
	LEFT OUTER JOIN MtDbPhotoSale ON MtDbPhoto.Id = MtDbPhotoSale.MtDbPhotoId
GO
PRINT N'Update complete.';


GO
