--IF NOT EXISTS(SELECT * FROM SYS.DATABASES WHERE name='[Travel Agency]')
--	CREATE DATABASE [Travel Agency]

USE [Travel Agency]
GO

DROP TABLE IF EXISTS dbo.TRIP_FACT;
DROP TABLE IF EXISTS dbo.DATE_DIM;
DROP TABLE IF EXISTS dbo.LOCATION_DIM;
DROP TABLE IF EXISTS dbo.TRANSPORT_DIM;
DROP TABLE IF EXISTS dbo.HOTEL_DIM;
DROP TABLE IF EXISTS dbo.TRIP_INFO_DIM;


CREATE TABLE HOTEL_DIM (
	HotelID int IDENTITY(1,1) PRIMARY KEY,
	HotelKEY int,
	HotelName varchar(40),
	HotelType varchar(40),
	InsertionDate date,
	ExpiredDate date
);

CREATE TABLE TRIP_INFO_DIM (
	TripInfoID int IDENTITY(1,1) PRIMARY KEY,
	TripType varchar(50),
	TripNotes varchar(60)
);

CREATE TABLE TRANSPORT_DIM (
	TransportID int IDENTITY(1,1) PRIMARY KEY,
	TransportKEY int ,
	TransportCompanyName varchar(40),
	TransportType varchar(30),
	DiscountRange varchar(50)
);

CREATE TABLE LOCATION_DIM (
	LocationID int IDENTITY(1,1) PRIMARY KEY,
	LocationKEY int,
	City varchar(40),
	Country varchar(30) 
);

  CREATE TABLE DATE_DIM(
	DateID int IDENTITY(1,1) PRIMARY KEY,
	Date Date, 
	Year INT, 
	Month INT, 
	DayOfWeek VARCHAR(20),
	Season varchar(20),
	Holiday varchar(40)
);

CREATE TABLE TRIP_FACT (
	TripID int IDENTITY(1,1) PRIMARY KEY,
	StartDateID int FOREIGN KEY REFERENCES DATE_DIM,
	FinishDateID int FOREIGN KEY REFERENCES DATE_DIM,
	StartingLocationID int FOREIGN KEY REFERENCES LOCATION_DIM,
	DestinationLocationID int FOREIGN KEY REFERENCES LOCATION_DIM,
	ArrivalTransportID int FOREIGN KEY REFERENCES TRANSPORT_DIM,
	DepartureTransportID int FOREIGN KEY REFERENCES TRANSPORT_DIM,
	HotelID int FOREIGN KEY REFERENCES HOTEL_DIM,
	TripInfoID int FOREIGN KEY REFERENCES TRIP_INFO_DIM,
	NumberOfParticipants int,
	Profit float,
	NumberOfPeopleInAgeRange1 int,
	NumberOfPeopleInAgeRange2 int,
	NumberOfPeopleInAgeRange3 int,
	NumberOfPeopleInAgeRange4 int,
	NumberOfPeopleInAgeRange5 int
);
