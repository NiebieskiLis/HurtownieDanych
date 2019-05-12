
--Trip info
DECLARE @cnt1 INT = 0;
 DECLARE @cnt2 INT = 0;

	WHILE @cnt1 < 4
	BEGIN
		SET @cnt2 = 0
		WHILE @cnt2 < 4
		BEGIN
			INSERT INTO TRIP_INFO_DIM(TripType, TripNotes)
				VALUES (CASE
							WHEN @cnt1 = 0 THEN 'round trip'
							WHEN @cnt1 = 1 THEN 'recreation trip'
							WHEN @cnt1 = 2 THEN 'leisure trip'
							WHEN @cnt1 = 3 THEN 'individual trip'
						END, 
						CASE
							WHEN @cnt2 = 0 THEN 'transport delay'
							WHEN @cnt2 = 1 THEN 'natural catastrophy'
							WHEN @cnt2 = 2 THEN 'problems with the hotel'
							WHEN @cnt2 = 3 THEN 'none'
						END)
		SET @cnt2 = @cnt2 + 1 
		END
	SET @cnt1 = @cnt1 + 1 
	END
--Data

	DECLARE @start DATE = '2015-01-01'
	WHILE @start < GETDATE()
	  BEGIN
		INSERT INTO DATE_DIM (Date, Year, Month, DayOfWeek, Season, Holiday)
		VALUES(@start, DATEPART(YY,@start), DATEPART(mm,@start), DATENAME(dw,@start),
				CASE
					WHEN DATEPART(mm,@start) = 12 OR DATEPART(mm,@start) = 1 OR DATEPART(mm,@start) = 2 THEN 'Winter'
					WHEN DATEPART(mm,@start) = 3 OR DATEPART(mm,@start) = 4 OR DATEPART(mm,@start) = 5 THEN 'Spring'
					WHEN DATEPART(mm,@start) = 6 OR DATEPART(mm,@start) = 7 OR DATEPART(mm,@start) = 8 THEN 'Summer'
					WHEN DATEPART(mm,@start) = 9 OR DATEPART(mm,@start) = 10 OR DATEPART(mm,@start) = 11 THEN 'Autumn'
				END, NULL
)
		SET @start = DATEADD(dd,1,@start)
	  END


--Christmas
UPDATE DATE_DIM
	SET Holiday = 'Christmas Day'
		WHERE DATEPART(mm, Date) = 12 AND DATEPART(dd, Date) = 25

--New Years Day
UPDATE DATE_DIM
	SET Holiday = 'New Years Day'
		WHERE DATEPART(mm, Date) = 1 AND DATEPART(dd, Date) = 1

UPDATE DATE_DIM
	SET Holiday = 'None'
		WHERE Holiday IS NULL