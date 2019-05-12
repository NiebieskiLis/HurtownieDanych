Merge Into [Travel Agency].[dbo].[TRANSPORT] as TargetTable
        Using [Baza firmy].[dbo].[TRANSPORT_COMPANY] as SourceTable
	      On TargetTable.[TransportID] = SourceTable.[CompanyID]
			When Not Matched 
				Then -- The ID in the Source is not found the Target
					INSERT 
					Values ( SourceTable.[CompanyName],SourceTable.[TransportType]
					            ,cast( CASE
									WHEN SourceTable.Discount <= 14 THEN 'SMALL group of people'
									WHEN SourceTable.Discount BETWEEN 15 AND 28 THEN 'MEDIUM group of people'
									WHEN SourceTable.Discount >= 29 THEN 'LARGE group of people'
									END as varchar(50))
);


				