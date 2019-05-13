Merge Into [Travel Agency].dbo.HOTEL_DIM as TargetTable
        Using [Baza firmy].dbo.HOTEL as SourceTable
	      On TargetTable.HotelKEY = SourceTable.HotelID
			When Not Matched 
				Then -- The ID in the Source is not found the Target
					INSERT 
					Values ( SourceTable.[HotelID]
					            , SourceTable.[HotelName]
					            , SourceTable.[HotelType],GETDATE(), cast(NULL as date) )
			When Matched
			         AND (  SourceTable.[HotelName] <> TargetTable.[HotelName]
			         OR  SourceTable.[HotelType] <> TargetTable.[HotelType] ) 
					 AND TargetTable.[ExpiredDate] is null
			Then 
					UPDATE
					SET TargetTable.[ExpiredDate] = GETDATE()
			When Not Matched By Source 
				Then 
					UPDATE
					SET TargetTable.[ExpiredDate] = GetDate()  ;
go

Insert into [Travel Agency].dbo.HOTEL_DIM
		([HotelKEY]
		, [HotelName]
		, [HotelType],[InsertionDate] ,[ExpiredDate] )
		Select HotelID, HotelName, HotelType ,GetDate(), cast(null as date)  from [Baza firmy].dbo.HOTEL 
		Except 
		Select HotelKEY, HotelName, HotelType,GetDate(), Null from [Travel Agency].dbo.HOTEL_DIM

Exec seeTables;
--select getdate()
--update [Baza firmy].dbo.HOTEL
--	set HotelName = 'HotelTest'
--	where HotelID = 1
--select * from HOTEL_DIM
--where HotelKEY=1
