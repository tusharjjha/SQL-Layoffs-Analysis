# World Layoffs Data Cleaning & Exploratory Data Analysis Using SQL

## Project Overview

This project focuses on cleaning and exploring a real-world layoffs dataset using MySQL.

The project is divided into two main parts: Data Cleaning and Exploratory Data Analysis (EDA). The first part focuses on preparing the raw data by removing duplicates, handling missing values, standardizing inconsistent entries, and converting data types. After cleaning, the second part explores the dataset to identify patterns and trends in layoffs across companies, industries, countries, and years.

The main objective was to practice SQL on a real-world dataset and understand how raw data can be cleaned and analyzed to find useful information.

## Tools Used

- MySQL
- MySQL Workbench
- SQL

## Dataset

The dataset contains information about company layoffs, including company names, locations, industries, total layoffs, percentage of workforce laid off, dates, funding stages, and funds raised.

**Dataset Source:** [Kaggle – Layoffs Dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022)

## Project Structure

```text
World-Layoffs-SQL-Analysis/
│
├── README.md
│
├── MYSQL_PROJECT.sql
│
└── EXPLORATORY DATA ANALYSIS.sql
```

## 1. Data Cleaning

The raw dataset was prepared before performing the analysis. The following operations were carried out:

### Duplicate Removal
- Created staging tables to work with the raw data.
- Used `ROW_NUMBER()` with a CTE to identify duplicate records.
- Removed duplicate rows from the staging table.

### Standardizing Data
- Removed unnecessary spaces from company names using `TRIM()`.
- Standardized inconsistent location entries.
- Converted the date column from text into the proper `DATE` format.

### Handling NULL and Blank Values
- Identified missing and blank industry values.
- Used a self-join to find available industry information for companies with missing values.
- Converted blank values in the funds raised and stage columns into NULL.

### Removing Unnecessary Data
- Removed records where both total layoffs and percentage laid off were missing.
- Removed the temporary row number column used during duplicate identification.

## 2. Exploratory Data Analysis (EDA)

After cleaning the dataset, I explored it to understand different patterns in layoffs.

The analysis included:

- Finding the maximum total layoffs and percentage laid off.
- Identifying companies with the highest number of layoffs.
- Analyzing layoffs by industry.
- Comparing layoffs across different countries.
- Exploring layoffs by year and company stage.
- Analyzing monthly layoffs.
- Calculating cumulative layoffs using rolling totals.
- Finding company-wise layoffs for each year.
- Ranking the top five companies by layoffs for each year using `DENSE_RANK()`.

## SQL Concepts Used

Throughout the project, I worked with:

- SELECT, WHERE, GROUP BY and ORDER BY
- Aggregate functions such as SUM(), MAX() and MIN()
- UPDATE, DELETE and ALTER TABLE
- TRIM() and STR_TO_DATE()
- JOINs and self-joins
- Common Table Expressions (CTEs)
- ROW_NUMBER()
- DENSE_RANK()
- Window functions
- Rolling totals
- Date and string functions

## Key Learning Outcomes

This project helped me gain practical experience in preparing raw data for analysis and working with SQL beyond basic queries.

I practiced using joins, CTEs and window functions to handle data cleaning tasks and explore trends in a real-world dataset.
