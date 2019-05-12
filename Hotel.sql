Merge Into [Travel Agency].dbo.HOTEL_DIM as TargetTable
        Using [Baza firmy].dbo.HOTEL as SourceTable
	      On TargetTable.HotelID = SourceTable.HotelID
			When Not Matched 
				Then -- The ID in the Source is not found the Target
					INSERT 
					Values ( SourceTable.[HotelID]
					            , SourceTable.[HotelName]
					            , SourceTable.[HotelType],GETDATE(), cast(NULL as date) )
	--		When Matched 
	--		         AND (SourceTable.[HotelName] <> TargetTable.[HotelName] 
	--		        OR SourceTable.[HotelType] <> TargetTable.[HotelType] ) 
	--		Then 
	--				UPDATE -- change the data in the Target table (DimCustomers)
	--				SET SourceTable.[ExpiredDate] = GETDATE()
	--				 -- The ID in the Source is not found the Target
	--				INSERT 
	--				Values ( SourceTable.[HotelID]
	--				            , SourceTable.[HotelName]
	--				            , SourceTable.[HotelType],GETDATE(), cast(NULL as date) )
			
	;

