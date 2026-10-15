USE GlobalSupply
GO

SELECT
    COUNT(*) AS Total_Shipments,

    SUM(CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END) AS Total_Disruptions,

    (
        SUM(CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END) * 100.0
        / COUNT(*)
    ) AS Disruption_Rate_Percent,

    AVG(Lead_Time_Days) AS Average_Lead_Time_Days,

    AVG(Distance_km) AS Average_Distance_km,

    AVG(Carrier_Reliability_Score) AS Average_Carrier_Reliability,

    AVG(Geopolitical_Risk_Score) AS Average_Geopolitical_Risk

FROM [dbo].[Shipments];
GO

SELECT
    Transport_Mode,

    COUNT(*) AS Total_Shipments,

    SUM(CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END) AS Total_Disruptions,

    (
        SUM(CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END) * 100.0
        / COUNT(*)
    ) AS Disruption_Rate_Percent

FROM [dbo].[Shipments]

GROUP BY Transport_Mode

ORDER BY Disruption_Rate_Percent DESC;
GO

SELECT
    Product_Category,

    COUNT(*) AS Total_Shipments,

    SUM(CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END) AS Total_Disruptions,

    (
        SUM(CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END) * 100.0
        / COUNT(*)
    ) AS Disruption_Rate_Percent

FROM [dbo].[Shipments]

GROUP BY Product_Category

ORDER BY Disruption_Rate_Percent DESC;
GO

SELECT
    Weather_Condition,

    COUNT(*) AS Total_Shipments,

    SUM(CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END) AS Total_Disruptions,

    (
        SUM(CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END) * 100.0
        / COUNT(*)
    ) AS Disruption_Rate_Percent

FROM [dbo].[Shipments]

GROUP BY Weather_Condition

ORDER BY Disruption_Rate_Percent DESC;
GO

SELECT
    CASE
        WHEN Geopolitical_Risk_Score <= 3 THEN 'Low Risk'
        WHEN Geopolitical_Risk_Score <= 6 THEN 'Medium Risk'
        WHEN Geopolitical_Risk_Score <= 10 THEN 'High Risk'
    END AS Risk_Category,

    COUNT(*) AS Total_Shipments,

    SUM(CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END) AS Total_Disruptions,

    (
        SUM(CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END) * 100.0
        / COUNT(*)
    ) AS Disruption_Rate_Percent

FROM [dbo].[Shipments]

GROUP BY
    CASE
        WHEN Geopolitical_Risk_Score <= 3 THEN 'Low Risk'
        WHEN Geopolitical_Risk_Score <= 6 THEN 'Medium Risk'
        WHEN Geopolitical_Risk_Score <= 10 THEN 'High Risk'
    END

ORDER BY Disruption_Rate_Percent DESC;
GO

SELECT
    CASE
        WHEN Carrier_Reliability_Score < 0.70 THEN 'Low Reliability'
        WHEN Carrier_Reliability_Score < 0.85 THEN 'Medium Reliability'
        WHEN Carrier_Reliability_Score <= 1.00 THEN 'High Reliability'
    END AS Reliability_Category,

    COUNT(*) AS Total_Shipments,

    SUM(CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END) AS Total_Disruptions,

    (
        SUM(CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END) * 100.0
        / COUNT(*)
    ) AS Disruption_Rate_Percent

FROM [dbo].[Shipments]

GROUP BY
    CASE
        WHEN Carrier_Reliability_Score < 0.70 THEN 'Low Reliability'
        WHEN Carrier_Reliability_Score < 0.85 THEN 'Medium Reliability'
        WHEN Carrier_Reliability_Score <= 1.00 THEN 'High Reliability'
    END

ORDER BY Disruption_Rate_Percent DESC;
GO

SELECT
    Transport_Mode,
    COUNT(*) AS Total_Shipments,
    AVG(Lead_Time_Days) AS Average_Lead_Time_Days,
    MIN(Lead_Time_Days) AS Minimum_Lead_Time_Days,
    MAX(Lead_Time_Days) AS Maximum_Lead_Time_Days
FROM [dbo].[Shipments]
GROUP BY Transport_Mode
ORDER BY Average_Lead_Time_Days DESC;
GO

SELECT
    CASE
        WHEN Disruption_Occurred = 1 THEN 'Disrupted'
        ELSE 'Not Disrupted'
    END AS Shipment_Status,
    COUNT(*) AS Total_Shipments,
    AVG(Lead_Time_Days) AS Average_Lead_Time_Days,
    MIN(Lead_Time_Days) AS Minimum_Lead_Time_Days,
    MAX(Lead_Time_Days) AS Maximum_Lead_Time_Days
FROM [dbo].[Shipments]
GROUP BY Disruption_Occurred
ORDER BY Average_Lead_Time_Days DESC;
GO

SELECT
    Origin_Port,
    Destination_Port,

    COUNT(*) AS Total_Shipments,

    SUM(
        CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END
    ) AS Total_Disruptions,

    CAST(
        SUM(
            CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*)
        AS DECIMAL(6,2)
    ) AS Disruption_Rate_Percent

FROM [dbo].[Shipments]

GROUP BY
    Origin_Port,
    Destination_Port

ORDER BY
    Disruption_Rate_Percent DESC;
GO

SELECT
    Origin_Port,
    Destination_Port,

    COUNT(*) AS Total_Shipments,

    AVG(Lead_Time_Days) AS Average_Lead_Time_Days,

    MIN(Lead_Time_Days) AS Minimum_Lead_Time_Days,

    MAX(Lead_Time_Days) AS Maximum_Lead_Time_Days

FROM [dbo].[Shipments]

GROUP BY
    Origin_Port,
    Destination_Port

ORDER BY
    Average_Lead_Time_Days DESC;
GO

SELECT
    Origin_Port,
    Destination_Port,

    COUNT(*) AS Total_Shipments,

    SUM(
        CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END
    ) AS Total_Disruptions,

    CAST(
        SUM(
            CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*)
        AS DECIMAL(6,2)
    ) AS Disruption_Rate_Percent,

    CAST(
        AVG(Lead_Time_Days)
        AS DECIMAL(10,2)
    ) AS Average_Lead_Time_Days

FROM [dbo].[Shipments]

GROUP BY
    Origin_Port,
    Destination_Port

HAVING COUNT(*) >= 20

ORDER BY
    Disruption_Rate_Percent DESC,
    Average_Lead_Time_Days DESC;
GO

SELECT
    YEAR(Date) AS Shipment_Year,
    MONTH(Date) AS Shipment_Month,

    DATENAME(MONTH, Date) AS Month_Name,

    COUNT(*) AS Total_Shipments,

    SUM(
        CASE
            WHEN Disruption_Occurred = 1 THEN 1
            ELSE 0
        END
    ) AS Total_Disruptions,

    CAST(
        SUM(
            CASE
                WHEN Disruption_Occurred = 1 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*)
        AS DECIMAL(6,2)
    ) AS Disruption_Rate_Percent

FROM [dbo].[Shipments]

GROUP BY
    YEAR(Date),
    MONTH(Date),
    DATENAME(MONTH, Date)

ORDER BY
    Shipment_Year,
    Shipment_Month;
GO

-- COMBINED RISK ASSESSMENT --

SELECT
    Shipment_ID,
    Date,
    Origin_Port,
    Destination_Port,
    Transport_Mode,

    Geopolitical_Risk_Score,
    Carrier_Reliability_Score,
    Weather_Condition,
    Lead_Time_Days,
    Disruption_Occurred,

    CASE
        WHEN Geopolitical_Risk_Score >= 7
             AND Carrier_Reliability_Score < 0.70
             AND Lead_Time_Days > 30
            THEN 'High Priority'

        WHEN Geopolitical_Risk_Score >= 7
             AND Carrier_Reliability_Score < 0.70
            THEN 'Elevated Risk'

        WHEN Geopolitical_Risk_Score >= 7
             AND Lead_Time_Days > 30
            THEN 'Elevated Risk'

        WHEN Carrier_Reliability_Score < 0.70
             AND Lead_Time_Days > 30
            THEN 'Elevated Risk'

        ELSE 'Other Shipments'
    END AS Risk_Category

FROM [dbo].[Shipments]

ORDER BY
    CASE
        WHEN Geopolitical_Risk_Score >= 7
             AND Carrier_Reliability_Score < 0.70
             AND Lead_Time_Days > 30
            THEN 1

        WHEN (
            Geopolitical_Risk_Score >= 7
            AND Carrier_Reliability_Score < 0.70
        )
        OR (
            Geopolitical_Risk_Score >= 7
            AND Lead_Time_Days > 30
        )
        OR (
            Carrier_Reliability_Score < 0.70
            AND Lead_Time_Days > 30
        )
            THEN 2

        ELSE 3
    END,
    Lead_Time_Days DESC;
GO

-- FINAL VALIDATION OF SHIPMENTS RECORDS --

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Shipment_ID) AS Unique_Shipment_IDs,
    COUNT(*) - COUNT(DISTINCT Shipment_ID) AS Duplicate_ID_Count,
    MIN(Date) AS Earliest_Shipment_Date,
    MAX(Date) AS Latest_Shipment_Date
FROM [dbo].[Shipments];
GO

SELECT
    Disruption_Occurred,
    COUNT(*) AS Shipment_Count
FROM [dbo].[Shipments]
GROUP BY Disruption_Occurred
ORDER BY Disruption_Occurred;
GO





