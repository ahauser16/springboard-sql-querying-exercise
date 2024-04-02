--1Q. Observe the result of running this SQL command to show the name, continent and population of all countries.
--1A.
SELECT name,
    continent,
    population
FROM world;
--2.How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
--2A.
SELECT name
FROM world
WHERE population > 200000000;
--3Q. Give the name and the per capita GDP for those countries with a population of at least 200 million.
--3A. 
SELECT name,
    gdp / population
FROM world
WHERE population >= 200000000;
--4Q. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
--4A. 
select name,
    population / 1000000
from world
where continent = 'South America';
--5Q. Show the name and population for France, Germany, Italy
--5A.  
SELECT name,
    population
FROM world
WHERE name = 'France'
    or name = 'Germany'
    or name = 'Italy';
--6Q. Show the countries which have a name that includes the word 'United'
--6A.
select name
from world
where name LIKE '%United%';
--7Q. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. Show the countries that are big by area or big by population. Show name, population and area.
--7A.
select name,
    population,
    area
from world
where (area > 3000000)
    or (population > 250000000);
--8Q. Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
--8A. 
select name,
    population,
    area
from world
where (area > 3000000)
    XOR (population > 250000000);
--9Q. For South America show population in millions and GDP in billions both to 2 decimal places.
--9A.
SELECT name,
    ROUND(population / 1000000, 2),
    ROUND(gdp / 1000000000, 2)
FROM world
WHERE continent = 'South America';
--10Q. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.  Show per-capita GDP for the trillion dollar countries to the nearest $1000.
--10A.
SELECT name,
    ROUND((gdp / population) / 1000) * 1000
FROM world
WHERE gdp >= 1000000000000;
--11Q. Greece has capital Athens.  Each of the strings 'Greece', and 'Athens' has 6 characters.  Show the name and capital where the name and the capital have the same number of characters.  You can use the LENGTH function to find the number of characters in a string. 
--11A.
SELECT name,
    capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);
--12Q. The capital of Sweden is Stockholm. Both words start with the letter 'S'.  Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
--note: You can use the function LEFT to isolate the first character.
--note: You can use <> as the NOT EQUALS operator.
--12A.  
SELECT name,
    capital
from world
where LEFT(name, 1) = LEFT(capital, 1)
    and name <> capital;
--13Q. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.  Find the country that has all the vowels and no spaces in its name.
-- note: You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
-- note: The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'
--13A.
SELECT name
FROM world
WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %';

-- BBC QUIZ

-- table reference for questions that follow

name continent area population gdp Afghanistan South Asia 652225 26000000 Albania Europe 28728 3200000 6656000000 Algeria Middle East 2400000 32900000 75012000000 Andorra Europe 468 64000 Brazil South America 8550000 182800000 564852000000 Colombia South America 1140000 45600000 Nauru Asia - Pacific 21 9900 Uzbekistan Central Asia 447000 26000000 

--1a. Select the code which gives the name of countries beginning with U
SELECT name
FROM world
WHERE name LIKE 'U%' --2q. Select the code which shows just the population of United Kingdom?
    --2a.
SELECT population
FROM world
WHERE name = 'United Kingdom' --3q. 3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
SELECT continent
FROM world
WHERE 'name' = 'France' --3a. 'name' should be name
    --4q. Select the result that would be obtained from the following code:
SELECT name,
    population / 10
FROM world
WHERE population < 10000 --4a.
    Nauru 990 --5q. Select the code which would reveal the name and population of countries in Europe and Asia:
    --5a.
SELECT name,
    population
FROM world
WHERE continent IN ('Europe', 'Asia') --6q. Select the code which would give two rows
    --6a.
SELECT name
FROM world
WHERE name IN ('Cuba', 'Togo') --7q. Select the result that would be obtained from this code:
SELECT name
FROM world
WHERE continent = 'South America'
    AND population > 40000000 --7a.
    Brazil Colombia