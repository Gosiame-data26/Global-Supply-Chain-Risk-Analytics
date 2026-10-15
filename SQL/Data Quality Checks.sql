USE GlobalSupply;
GO

SELECT *
FROM Shipments_raw
WHERE Lead_Time_Days > 200;
GO

SELECT *
FROM Shipments_raw
WHERE TRY_CAST(Lead_Time_Days AS FLOAT) > 200;
GO

SELECT
    Shipment_ID,
    Origin_Port,
    Destination_Port,
    Transport_Mode,
    Distance_km,
    Lead_Time_Days,
    Disruption_Occurred
FROM Shipments_raw
WHERE TRY_CAST(Distance_km AS FLOAT) < 500;
GO

SELECT
    Shipment_ID,
    Origin_Port,
    Destination_Port,
    Transport_Mode,
    Distance_km,
    Weight_MT,
    Lead_Time_Days,
    Disruption_Occurred
FROM Shipments_raw
WHERE TRY_CAST(Weight_MT AS FLOAT) <= 0;
GO

SELECT
    Shipment_ID,
    Origin_Port,
    Destination_Port,
    Transport_Mode,
    Distance_km,
    Weight_MT,
    Fuel_Price_Index,
    Lead_Time_Days,
    Disruption_Occurred
FROM Shipments_raw
WHERE TRY_CAST(Fuel_Price_Index AS FLOAT) <= 0;
GO

SELECT
     Shipment_ID,
     Origin_Port,
     Destination_Port,
     Geopolitical_Risk_Score,
     Disruption_Occurred
FROM Shipments_raw
WHERE TRY_CAST(Geopolitical_Risk_Score AS FLOAT) <= 0
    OR TRY_CAST(Geopolitical_Risk_Score AS FLOAT) > 10;
GO

SELECT
    MIN(TRY_CAST(Geopolitical_Risk_Score AS FLOAT)) AS Minimum_Invalid_Risk,
    MAX(TRY_CAST(Geopolitical_Risk_Score AS FLOAT)) AS Maximum_Invalid_Risk
FROM Shipments_raw
WHERE TRY_CAST(Geopolitical_Risk_Score AS FLOAT) < 0
   OR TRY_CAST(Geopolitical_Risk_Score AS FLOAT) > 10;
GO

SELECT DISTINCT
    Geopolitical_Risk_Score
FROM Shipments_raw
WHERE TRY_CAST(Geopolitical_Risk_Score AS FLOAT) < 0
   OR TRY_CAST(Geopolitical_Risk_Score AS FLOAT) > 10;
GO

SELECT
    Geopolitical_Risk_Score,
    TRY_CAST(Geopolitical_Risk_Score AS FLOAT) AS Risk_As_Number
FROM Shipments_raw
WHERE TRY_CAST(Geopolitical_Risk_Score AS FLOAT) < 0
   OR TRY_CAST(Geopolitical_Risk_Score AS FLOAT) > 10;
GO

SELECT
     Shipment_ID,
     Origin_Port,
     Destination_Port,
     Geopolitical_Risk_Score,
     Carrier_Reliability_Score,
     Disruption_Occurred
FROM Shipments_raw
WHERE TRY_CAST(Carrier_Reliability_Score AS FLOAT) <= 0
    OR TRY_CAST(Carrier_Reliability_Score AS FLOAT) > 1;
GO

SELECT
    Shipment_ID,
    Origin_Port,
    Destination_Port,
    Transport_Mode,
    Lead_Time_Days,
    Disruption_Occurred
FROM Shipments_raw
WHERE TRY_CAST(Lead_Time_Days AS FLOAT) <= 0;
GO

SELECT
    COUNT(*) AS Invalid_Date_Count
FROM Shipments_raw
WHERE TRY_CAST(Date AS DATE) IS NULL;
GO

SELECT
    MIN(TRY_CAST(Date AS DATE)) AS Earliest_Shipment_Date,
    MAX(TRY_CAST(Date AS DATE)) AS Latest_Shipment_Date
FROM Shipments_raw;
GO

SELECT
    Shipment_ID,
    Origin_Port,
    Destination_Port,
    Disruption_Occurred
FROM Shipments_raw
WHERE TRY_CAST(Disruption_Occurred AS INT) NOT IN (0, 1);
GO

SELECT
    COUNT(*) AS Blank_or_Whitespace_Values
FROM Shipments_raw
WHERE LTRIM(RTRIM(Shipment_ID)) = ''
   OR LTRIM(RTRIM(Origin_Port)) = ''
   OR LTRIM(RTRIM(Destination_Port)) = ''
   OR LTRIM(RTRIM(Transport_Mode)) = ''
   OR LTRIM(RTRIM(Product_Category)) = ''
   OR LTRIM(RTRIM(Weather_Condition)) = ''
   OR LTRIM(RTRIM(Disruption_Occurred)) = ''
   OR LTRIM(RTRIM(Date)) = ''
   OR LTRIM(RTRIM(Distance_km)) = ''
   OR LTRIM(RTRIM(Weight_MT)) = ''
   OR LTRIM(RTRIM(Fuel_Price_Index)) = ''
   OR LTRIM(RTRIM(Geopolitical_Risk_Score)) = ''
   OR LTRIM(RTRIM(Carrier_Reliability_Score)) = ''
   OR LTRIM(RTRIM(Lead_Time_Days)) = '';
GO

-- CLEAN SHIPMENTS TABLE CREATION --

CREATE TABLE [dbo].[Shipments] (
   
   Shipment_ID NVARCHAR(50),
    Date DATE,
    Origin_Port NVARCHAR(50),
    Destination_Port NVARCHAR(50),
    Transport_Mode NVARCHAR(50),
    Product_Category NVARCHAR(50),
    Distance_km DECIMAL(10,2),
    Weight_MT DECIMAL(10,2),
    Fuel_Price_Index DECIMAL(10,3),
    Geopolitical_Risk_Score DECIMAL(5,2),
    Weather_Condition NVARCHAR(50),
    Carrier_Reliability_Score DECIMAL(5,3),
    Lead_Time_Days DECIMAL(10,2),
    Disruption_Occurred INT
);
GO

SELECT *
FROM [dbo].[Shipments]
GO

INSERT INTO [dbo].[Shipments] (
    Shipment_ID,
    Date,
    Origin_Port,
    Destination_Port,
    Transport_Mode,
    Product_Category,
    Distance_km,
    Weight_MT,
    Fuel_Price_Index,
    Geopolitical_Risk_Score,
    Weather_Condition,
    Carrier_Reliability_Score,
    Lead_Time_Days,
    Disruption_Occurred
)
SELECT
    Shipment_ID,
    TRY_CAST(Date AS DATE),
    Origin_Port,
    Destination_Port,
    Transport_Mode,
    Product_Category,
    TRY_CAST(Distance_km AS DECIMAL(10,2)),
    TRY_CAST(Weight_MT AS DECIMAL(10,2)),
    TRY_CAST(Fuel_Price_Index AS DECIMAL(10,3)),
    TRY_CAST(Geopolitical_Risk_Score AS DECIMAL(5,2)),
    Weather_Condition,
    TRY_CAST(Carrier_Reliability_Score AS DECIMAL(5,3)),
    TRY_CAST(Lead_Time_Days AS DECIMAL(10,2)),
    TRY_CAST(Disruption_Occurred AS INT)
FROM Shipments_Raw;
GO

SELECT COUNT(*) AS Shipment_Count
FROM [dbo].[Shipments];
GO

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Shipments'
ORDER BY ORDINAL_POSITION;
GO

SELECT
    COUNT(CASE WHEN Date IS NULL THEN 1 END) AS Null_Date,
    COUNT(CASE WHEN Distance_km IS NULL THEN 1 END) AS Null_Distance_km,
    COUNT(CASE WHEN Weight_MT IS NULL THEN 1 END) AS Null_Weight_MT,
    COUNT(CASE WHEN Fuel_Price_Index IS NULL THEN 1 END) AS Null_Fuel_Price_Index,
    COUNT(CASE WHEN Geopolitical_Risk_Score IS NULL THEN 1 END) AS Null_Geopolitical_Risk_Score,
    COUNT(CASE WHEN Carrier_Reliability_Score IS NULL THEN 1 END) AS Null_Carrier_Reliability_Score,
    COUNT(CASE WHEN Lead_Time_Days IS NULL THEN 1 END) AS Null_Lead_Time_Days,
    COUNT(CASE WHEN Disruption_Occurred IS NULL THEN 1 END) AS Null_Disruption_Occurred
FROM [dbo].[Shipments];
GO
