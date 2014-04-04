/*
 * Financial Reconciliation ETL
 * Project #67 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS, Stored Procedures
 * Created: 2012
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'ReconETL')
BEGIN
    ALTER DATABASE ReconETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ReconETL;
END
GO

CREATE DATABASE ReconETL
ON PRIMARY
(
    NAME = 'ReconETL_Data',
    FILENAME = 'C:\SQLData\ReconETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'ReconETL_Log',
    FILENAME = 'C:\SQLData\ReconETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE ReconETL SET RECOVERY SIMPLE;
ALTER DATABASE ReconETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE ReconETL;
GO

PRINT 'Database ReconETL created successfully';
PRINT 'Project: Financial Reconciliation ETL';
PRINT 'Description: Cross-system transaction matching';
GO
