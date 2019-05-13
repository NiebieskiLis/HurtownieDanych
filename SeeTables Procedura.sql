go
Create 
Procedure SeeTables
AS
  BEGIN
	
	Select top (3) * From [dbo].[DATE_DIM] as dateD ;
	Select top (3) * From [dbo].[HOTEL_DIM];
	Select top (3) * From [dbo].[LOCATION_DIM];
	Select top (3) * From [dbo].[TRANSPORT_DIM];
	Select top (3) * From [dbo].[TRIP_FACT];
	Select top (3) * From [dbo].[TRIP_INFO_DIM];
  END
go