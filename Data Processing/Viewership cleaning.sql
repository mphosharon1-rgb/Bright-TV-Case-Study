-- Databricks notebook source
SELECT *
FROM bright_tv.customers.viewership;
-- We are browsing for the data so that we can see what type of data we have before we can start cleaning.
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

--  We are having two user_ID, the first step is to check if the userid column is complete and it doesnt have NULLS.

SELECT *
FROM bright_tv.customers.viewership
WHERE UserID0 IS NULL
OR    userid4 IS NULL;                                                           --The columns do not have any NULLS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Checking if the two userID are not equal to each other.

SELECT *
FROM bright_tv.customers.viewership
WHERE UserID0<>userid4;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Checking for duplicates.

SELECT UserID0, RecordDate2,
COUNT(*) AS duplicates_Count
FROM bright_tv.customers.viewership
GROUP BY UserID0, RecordDate2
HAVING COUNT(*) >1
ORDER BY duplicates_Count DESC;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

