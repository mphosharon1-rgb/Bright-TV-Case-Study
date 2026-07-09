-- Databricks notebook source
select * from bright_tv.customers.dataset


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

      SELECT * FROM bright_tv.customers.viewership;
      
     SELECT RecordDate2,
         TO_DATE (RecordDate2) AS Watch_Day,
         MONTHNAME (TO_DATE(RecordDate2)) AS MONTH_NAME,
         DAYNAME (TO_DATE(RecordDate2)) AS DAY_NAME,
         CASE WHEN DAY_NAME IN ('Sat','Sun') THEN '02.Weekend'
         ELSE '01.Weekday'
         END AS Day_Type
         FROM bright_tv.customers.viewership;







