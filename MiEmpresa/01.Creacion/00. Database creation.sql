-- Replace 'New_Database' with your database name
IF NOT EXISTS 
    ( SELECT name FROM master.dbo.sysdatabases WHERE name = N'New_Database' ) 
    CREATE DATABASE [CONQUISTADORES]
ELSE
    BEGIN
        DROP DATABASE [CONQUISTADORES]
    END
go

USE New_Database

