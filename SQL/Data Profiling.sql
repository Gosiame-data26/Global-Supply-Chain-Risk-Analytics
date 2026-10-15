USE GlobalSupply;
GO

SELECT *
FROM Shipments_raw;
GO

SELECT COUNT(*) AS TotalRows
FROM Shipments_raw;
GO

SELECT 
    COUNT(Shipment_ID) AS Total_IDs,
    COUNT(DISTINCT Shipment_ID) AS Unique_IDs
FROM Shipments_raw;
GO

SELECT TOP 20 *
FROM Shipments_raw;
GO

-- CATEGORICAL VARIABLES (PROFILING COLUMNS) --

SELECT 
    Transport_Mode,
    COUNT(Transport_Mode) AS ShipmentCount
FROM Shipments_raw
GROUP BY Transport_Mode;
GO

SELECT 
    Origin_Port,
    COUNT(Origin_Port) AS ShipmentOriginCount
FROM Shipments_raw
GROUP BY Origin_Port;
GO

SELECT 
    Destination_Port,
    COUNT(Destination_Port) AS ShipmentDestinationCount
FROM Shipments_raw
GROUP BY Destination_Port;
GO

SELECT 
    Product_Category,
    COUNT(Product_Category) AS ProductCategoryCount
FROM Shipments_raw
GROUP BY Product_Category;
GO
    
SELECT 
    Weather_Condition,
    COUNT(Weather_Condition) AS WeatherConditionCount
FROM Shipments_raw
GROUP BY Weather_Condition;
GO

-- NUMERICAL PROFILING --

SELECT
    MIN(TRY_CAST(Distance_km AS FLOAT)) AS Min_Distance,
    MAX(TRY_CAST(Distance_km AS FLOAT)) AS Max_Distance,
    AVG(TRY_CAST(Distance_km AS FLOAT)) AS Avg_Distance,

    MIN(TRY_CAST(Weight_MT AS FLOAT)) AS Min_Weight,
    MAX(TRY_CAST(Weight_MT AS FLOAT)) AS Max_Weight,
    AVG(TRY_CAST(Weight_MT AS FLOAT)) AS Avg_Weight,

    MIN(TRY_CAST(Fuel_Price_Index AS FLOAT)) AS Min_Fuel_Index,
    MAX(TRY_CAST(Fuel_Price_Index AS FLOAT)) AS Max_Fuel_Index,
    AVG(TRY_CAST(Fuel_Price_Index AS FLOAT)) AS Avg_Fuel_Index,

    MIN(TRY_CAST(Geopolitical_Risk_Score AS FLOAT)) AS Min_Geo_Risk,
    MAX(TRY_CAST(Geopolitical_Risk_Score AS FLOAT)) AS Max_Geo_Risk,
    AVG(TRY_CAST(Geopolitical_Risk_Score AS FLOAT)) AS Avg_Geo_Risk,

    MIN(TRY_CAST(Carrier_Reliability_Score AS FLOAT)) AS Min_Carrier_Reliability,
    MAX(TRY_CAST(Carrier_Reliability_Score AS FLOAT)) AS Max_Carrier_Reliability,
    AVG(TRY_CAST(Carrier_Reliability_Score AS FLOAT)) AS Avg_Carrier_Reliability,

    MIN(TRY_CAST(Lead_Time_Days AS FLOAT)) AS Min_Lead_Time,
    MAX(TRY_CAST(Lead_Time_Days AS FLOAT)) AS Max_Lead_Time,
    AVG(TRY_CAST(Lead_Time_Days AS FLOAT)) AS Avg_Lead_Time

FROM Shipments_Raw;
GO

SELECT
    COUNT(*) AS Total_Rows,

    SUM(CASE WHEN TRY_CAST(Distance_km AS FLOAT) IS NULL THEN 1 ELSE 0 END) AS Invalid_Distance,
    SUM(CASE WHEN TRY_CAST(Weight_MT AS FLOAT) IS NULL THEN 1 ELSE 0 END) AS Invalid_Weight,
    SUM(CASE WHEN TRY_CAST(Fuel_Price_Index AS FLOAT) IS NULL THEN 1 ELSE 0 END) AS Invalid_Fuel_Index,
    SUM(CASE WHEN TRY_CAST(Geopolitical_Risk_Score AS FLOAT) IS NULL THEN 1 ELSE 0 END) AS Invalid_Geo_Risk,
    SUM(CASE WHEN TRY_CAST(Carrier_Reliability_Score AS FLOAT) IS NULL THEN 1 ELSE 0 END) AS Invalid_Carrier_Reliability,
    SUM(CASE WHEN TRY_CAST(Lead_Time_Days AS FLOAT) IS NULL THEN 1 ELSE 0 END) AS Invalid_Lead_Time

FROM Shipments_Raw;
GO
