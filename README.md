# Global-Supply-Chain-Risk-Analytics
An end-to-end supply chain analytics project using SQL Server and Power BI to investigate shipment disruptions, operational risks, and delivery performance.

## Project Overview

This project investigates shipment disruptions, operational risk factors, and logistics performance using SQL Server and Power BI.

The objective is to explore how transport modes, carrier reliability, weather conditions, geopolitical risk, and shipment characteristics are associated with disruptions and delivery lead times.

The project follows an analytics workflow covering data profiling, quality validation, SQL-based data preparation, DAX measures, interactive dashboard development, and business interpretation.

## Business Questions

1. How do shipment disruption rates vary by transport mode?
2. How do disruption rates differ across product categories?
3. How are weather conditions and geopolitical risk associated
   with shipment disruptions?
4. How do disruption rates vary across carrier reliability levels?
5. How do average lead times differ by transport mode and
   product category?
6. Which routes have the longest average shipment lead times?
7. How does the monthly disruption rate change over time?

## Tools and Technologies

- SQL Server
- SQL Server Management Studio (SSMS)
- Power BI Desktop
- DAX
- Power Query
- Microsoft Excel

## Dataset

The dataset contains 5,000 shipment records covering 1 January 2024 to 31 December 2025.

Key fields include:

- Shipment ID
- Shipment date
- Origin and destination ports
- Transport mode
- Product category
- Shipment distance and weight
- Fuel price index
- Geopolitical risk score
- Weather condition
- Carrier reliability score
- Lead time in days
- Disruption indicator

## Methodology

### 1. Data Profiling

- Examined record counts and unique shipment identifiers.
- Reviewed categorical values and numeric ranges.
- Checked the date range and field distributions.

### 2. Data Quality and Preparation

- Investigated missing and invalid values.
- Checked numeric fields and disruption indicators.
- Converted raw text fields into appropriate analytical data types.
- Created a clean analytical table in SQL Server.
- Validated the cleaned dataset.

### 3. Power BI Analysis

Developed a three-page interactive dashboard:

**Supply Chain Overview**
- Shipment and disruption KPIs
- Disruptions by transport mode and product category
- Monthly disruption rate
- Disruption rate by geopolitical risk level

**Risk Analysis**
- Disruption rates by carrier reliability
- Disruption rates by weather condition
- Disruption rates by geopolitical risk level

**Logistics Performance**
- Average lead time by transport mode
- Average lead time by product category
- Routes ranked by average lead time

## Key Findings

Findings will be documented after validating the final
dashboard figures and comparing the relevant categories.

## Limitations

- The analysis identifies patterns and associations; it does not establish that a particular factor causes shipment disruptions.
- Findings depend on the coverage, quality, and characteristics of the available dataset.
- Differences between categories may reflect multiple factors and require further investigation.

## Repository Structure

- `Data/` — source dataset, where distribution is permitted
- `SQL/` — SQL profiling, quality checks, and preparation scripts
- `PowerBI/` — Power BI report
- `Screenshots/` — dashboard screenshots
- `Documentation/` — methodology and supporting documentation

## Author

Gosiame
