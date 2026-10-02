# SQL Data Cleaning – Layoffs Dataset

## About the Project

For this project, I worked on cleaning a real-world layoffs dataset using MySQL. The dataset contains information about companies that have laid off employees, including their names, locations, industries, funding stages, number of employees laid off, and other related details.

Before starting any analysis, I wanted to make sure the data was consistent and properly organised. So, I went through the dataset and worked on identifying duplicates, correcting inconsistencies, handling missing values, and removing records that did not contain enough information.

The main purpose was to prepare the raw data for further analysis using SQL.

## Dataset

The dataset was taken from Kaggle:

[Layoffs Dataset – Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022)

It contains information about layoffs across different companies and industries.

Some of the columns included in the dataset are:
- Company
- Location
- Total Laid Off
- Date
- Percentage Laid Off
- Industry
- Source
- Stage
- Funds Raised
- Country
- Date Added

## Tools Used

- MySQL
- MySQL Workbench

## What I Did

### 1. Created Staging Tables

I started by creating staging tables so that I could work on a copy of the original data without modifying the raw table.

### 2. Removed Duplicate Records

I used `ROW_NUMBER()` with a CTE to identify duplicate records based on multiple columns. After checking the results, I removed the extra records from the staging table.

### 3. Standardised the Data

I checked different columns for inconsistent values and made corrections where needed.

Some of the changes included:
- Removing unnecessary spaces from company names using `TRIM()`.
- Reviewing industry and location values.
- Standardising the Vancouver location entry.

### 4. Converted Date Formats

The date column was initially stored as text. I used `STR_TO_DATE()` to convert the values into a proper date format and then changed the column's data type to `DATE`.

### 5. Handled NULL and Blank Values

I checked for missing and blank values, particularly in the industry column.

Where possible, I used information from other records belonging to the same company to fill missing industry values. I also converted blank entries in the `funds_raised` and `stage` columns into `NULL`.

### 6. Removed Incomplete Records

I identified records where both `total_laid_off` and `percentage_laid_off` were missing and removed them, as they did not provide useful information for the analysis.

### 7. Final Cleanup

After completing the cleaning process, I removed the temporary `row_num` column that was used to identify duplicates.

## SQL Concepts Practised

While working on this project, I used the following SQL concepts:

- Common Table Expressions (CTEs)
- Window Functions
- `ROW_NUMBER()`
- `JOIN`
- `TRIM()`
- `STR_TO_DATE()`
- `UPDATE` and `DELETE`
- `ALTER TABLE`
- `IS NULL`
- Data type conversion

## Repository Structure

```text
SQL-Layoffs-Analysis/
│
├── README.md
│
└── data_cleaning/
    └── MYSQL_PROJECT.sql
```

## What I Learned

This project helped me understand how data cleaning works in practice, especially when dealing with missing values, duplicate records, and inconsistent data.

I also got more comfortable using CTEs, window functions, joins, and different SQL statements to solve data-related problems.

It was a good opportunity to move beyond writing individual SQL queries and work on a complete data cleaning process.

## Next Step

This project is the first part of my SQL portfolio. I plan to continue working with the same dataset and use the cleaned data for Exploratory Data Analysis (EDA), where I will look into different patterns and trends in company layoffs.
