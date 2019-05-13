Merge Into [Travel Agency].[dbo].[LOCATION_DIM] as TargetTable
        Using [Baza firmy].[dbo].[ADDRESS] as SourceTable
	      On TargetTable.[LocationKEY] = SourceTable.[AddressID]
			When Not Matched 
				Then -- The ID in the Source is not found the Target
					INSERT 
					Values (SourceTable.[AddressID] ,SourceTable.[City], SourceTable.[Country]);

