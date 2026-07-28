-- Databricks notebook source
select * from bright_tv.customers.dataset;

select distinct gender
from bright_tv.customers.dataset;



-- Gender check
-----------------------------------------------------------------------------
select distinct
       case 
       when Gender = 'None' then 'unkown'
       when Gender = ' ' then 'unkown'
       else Gender
       end as Sex
       from bright_tv.customers.dataset;
------------------------------------------------------------------------------
-- Race check

 SELECT DISTINCT 
 Case when Race = 'other' then 'unkown' 
      when Race = ' ' then 'unkown'
      when Race = 'None' then 'unkown'
      else Race
      end as Ethnicity
 from bright_tv.customers.dataset;
 ---------------------------------------------------------------------------------
-- Province check

 SELECT DISTINCT 
 Case When Province = 'None' then 'unkown'
      When Province = ' ' then 'unkown'
      else Province
      end as Region
 
 from bright_tv.customers.dataset;


--Age check
SELECT Min(Age) as Min_Age,
       Max(Age) as Max_Age
       from bright_tv.customers.dataset;


SELECT DISTINCT
 Case when Age  between 0 AND 1 THEN 'Infants'   
      when Age  between 2 AND 12 THEN 'Kids'
      when Age  between 12 AND 19 THEN 'Teenagers'
      when Age  between 20 AND 35 THEN 'Youth'
      when Age  between 36 AND 45 THEN 'Adults'
      when Age  between 46 AND 60 THEN 'Older Adults'
      when Age > 60 then 'Pensioner'
      END AS Age_Group
      from bright_tv.customers.dataset;
      -------------------------------------------------------------------------------------

      SELECT UserID, 
             COUNT(*) AS duplicate
      FROM bright_tv.customers.dataset
      GROUP BY UserID
      HAVING COUNT(*)>1;

          -----------------------------------------------------------------------------------
    -- CHECKING THE SIZE OF THE DATA

     SELECT COUNT(*) AS No_of_Rows,
            COUNT(DISTINCT USerID) AS No_of_Subs
     from bright_tv.customers.dataset;

     SELECT COUNT(*) AS CNT
     FROM bright_tv.customers.dataset
     WHERE UserID IS NULL;


     SELECT DISTINCT UserID
     FROM bright_tv.customers.dataset;

            SELECT Email,
            CASE WHEN (Email is not null) or (Email not in('None')) or (email='')then 1
            else 0
            end as email_flag
            from bright_tv.customers.dataset;

            select
            case 
            when `Social Media Handle` is not null and `Social Media Handle` != '' and `Social Media Handle` not in ('None') then 1
            else 0
            end as sm_flag
            from bright_tv.customers.dataset;



      
      

      
      
      SELECT * FROM bright_tv.customers.viewership;

      SELECT COUNT (*) AS MISMATCHES
      FROM bright_tv.customers.viewership
      WHERE UserID0<>userid4;

      SELECT UserID0,userid4
      FROM bright_tv.customers.viewership
      WHERE UserID0 IS NULL OR userid4 IS NULL;

      SELECT COALESCE (UserID0,userid4) AS UserID,
             COUNT (*)
      FROM bright_tv.customers.viewership
      GROUP BY UserID0,userid4
      HAVING COUNT(*)>1;

      SELECT COUNT(*) AS No_of_Rows,
             COUNT(DISTINCT UserID0,userid4)
             FROM bright_tv.customers.viewership;

       SELECT DISTINCT (UserID0,userid4),
              COUNT (*)  
       FROM bright_tv.customers.viewership
       GROUP BY UserID0,userid4
       HAVING COUNT(*) > 0;

     SELECT RecordDate2,
         TO_DATE (RecordDate2) AS Watch_Day,
         MONTHNAME (TO_DATE(RecordDate2)) AS MONTH_NAME,
         DAYNAME (TO_DATE(RecordDate2)) AS DAY_NAME,
         CASE WHEN DAY_NAME IN ('Sat','Sun') THEN '02.Weekend'
         ELSE '01.Weekday'
         END AS Day_Type
         FROM bright_tv.customers.viewership;

         SELECT `Duration 2` FROM bright_tv.customers.viewership;

         SELECT DISTINCT Channel2
         FROM bright_tv.customers.viewership;

        SELECT COUNT(*) AS MISSING_UserID
        FROM bright_tv.customers.viewership
        WHERE UserID0 IS NULL OR userid4 IS NULL;
      
      SELECT COUNT(*) AS MATCHES
      FROM bright_tv.customers.viewership v
      INNER JOIN bright_tv.customers.dataset d
      ON v.UserID0 = d.UserID;

      SELECT COUNT(*) AS MATCHES
      FROM bright_tv.customers.viewership v
      INNER JOIN bright_tv.customers.dataset d
      ON v.userid4 = d.UserID;

      select UserID0, userid4,
             COUNT(*) AS Records
       from bright_tv.customers.viewership
       group by UserID0,userid4
       order by UserID0;

SELECT UserID0, userid4
FROM bright_tv.customers.viewership
WHERE UserID0<> userid4
LIMIT 10;

SELECT COUNT(*)
FROM bright_tv.customers.viewership
WHERE UserID0 = userid4;


SELECT COUNT(*)
FROM bright_tv.customers.viewership
WHERE UserID0 IS NULL AND userid4 IS NULL;
--------------------------------------------------------------------

SELECT `Duration 2`
FROM bright_tv.customers.viewership
LIMIT 10;

--CHECK FOR NULLS
SELECT *
FROM bright_tv.customers.viewership
WHERE `Duration 2` IS NULL;

----------------------------------------------------

SELECT 
MIN(`Duration 2`) AS min_watchtime
MAX(`Duration 2`) AS max_watchtime
frombright_tv.customers.viewership;

-- COMMAND ----------


