create database zomato;
use zomato

QUS.1....

SELECT 
    City,
    AVG(Rating) AS avg_rating
FROM zomato
GROUP BY City
ORDER BY avg_rating ASC
LIMIT 10;

QUS.2.....

SELECT 
    Cuisines,
    Rating,
    Average_Cost_for_two
FROM zomato
WHERE City = 'Kolkata'
AND Has_Online_delivery = 'Yes'
ORDER BY Rating DESC
LIMIT 1;

QUS.3.....

SELECT 
    Cuisines,
    Rating
FROM zomato
WHERE City = 'New Delhi'
AND Cuisines LIKE '%Pizza%'
ORDER BY Rating DESC
LIMIT 1;

QUS.4.....

SELECT 
    City,
    Cuisines,
    Average_Cost_for_two,
    Rating
FROM zomato
WHERE Rating >= 4
ORDER BY City, Average_Cost_for_two ASC;

QUS.5.....

SELECT 
   Cuisines ,
    City,
    Rating,
    Votes
FROM zomato
WHERE Has_Table_booking = 'No'
AND Rating < 3;

QUS.6.....

SELECT 
    City,
    COUNT(Cuisines) AS total_restaurants
FROM zomato
WHERE Rating >= 4.9
GROUP BY City
HAVING COUNT(Cuisines) >= 3
ORDER BY total_restaurants DESC, City ASC;

QUS.7.....

SELECT 
    c.Country,
    COUNT(z.Cuisines) AS total_restaurants
FROM zomato z
JOIN countrytable c
ON z.CountryCode = c.CountryCode
GROUP BY c.Country
ORDER BY total_restaurants DESC
LIMIT 5;

QUS.8....

SELECT 
    AVG(Average_Cost_for_two) AS avg_cost_for_two
FROM zomato;

QUS.9.....

SELECT 
CASE
    WHEN Average_Cost_for_two > 10000 THEN 'Luxurious Expensive'
    WHEN Average_Cost_for_two BETWEEN 5001 AND 10000 THEN 'Very Expensive'
    WHEN Average_Cost_for_two BETWEEN 2001 AND 5000 THEN 'Expensive'
    WHEN Average_Cost_for_two BETWEEN 1001 AND 2000 THEN 'High'
    WHEN Average_Cost_for_two BETWEEN 501 AND 1000 THEN 'Medium High'
    ELSE 'Average'
END AS cost_category,
COUNT(*) AS total_restaurants
FROM zomato
GROUP BY cost_category
ORDER BY total_restaurants DESC;