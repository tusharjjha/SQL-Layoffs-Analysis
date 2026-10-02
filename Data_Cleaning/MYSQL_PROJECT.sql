-- DATA CLEANING

-- https://www.kaggle.com/datasets/swaptr/layoffs-2022    [link To The Dataset Used In This Project]

SELECT *
FROM layoffs;


-- REMOVE DUPLICATES


CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, total_laid_off,  `date`, percentage_laid_off,
 industry, `source`, stage, funds_raised, country, date_added) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging
WHERE company = '';

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `total_laid_off` text,
  `date` text,
  `percentage_laid_off` text,
  `industry` text,
  `source` text,
  `stage` text,
  `funds_raised` text,
  `country` text,
  `date_added` text,
  `row_num` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, total_laid_off,  `date`, percentage_laid_off,
 industry, `source`, stage, funds_raised, country, date_added) AS row_num
FROM layoffs_staging;

SELECT * 
FROM layoffs_staging2
WHERE row_num > 1;

DELETE  
FROM layoffs_staging2
WHERE row_num > 1;


-- Standardizing data


SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;
 
UPDATE layoffs_staging2
SET location = 'Vancouver, Non-U.S.'
WHERE location = 'Vancouver';

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT `date`
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


-- NULL VALUES OR BLANK VALUES


SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
WHERE company = 'Eyeo';

SELECT *
FROM layoffs_staging2 ls1
JOIN layoffs_staging2 ls2
	ON ls1.company = ls2.company
WHERE (ls1.industry IS NULL OR ls1.industry = '')
AND ls2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET funds_raised = NULL
WHERE funds_raised = '';

UPDATE layoffs_staging2
SET stage = NULL
WHERE stage = '';

UPDATE layoffs_staging2 ls1
JOIN layoffs_staging2 ls2
	ON ls1.company = ls2.company
SET ls1.industry = ls2.industry
WHERE (ls1.industry IS NULL)
AND ls2.industry IS NOT NULL;


-- REMOVE UNWANTED COLUMN AND ROWS


SELECT *
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;


























