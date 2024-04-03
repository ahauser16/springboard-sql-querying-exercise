--hint you will be using the following functions: SUM, Count, MAX, DISTINCT and ORDER BY.

--question 1: Show the total population of the world.

--answer:
SELECT SUM(population) FROM world;

--question 2: List all the continents - just once each.
SELECT DISTINCT continent FROM world;

--question 3: What is the total GDP of Africa?

--answer:
select sum(gdp) from world where continent = 'Africa';

--question 4: How many countries have an area of at least 1000000

--answer:
select count(name) from world where area >= 1000000;

--question 5: What is the total population of ('Estonia', 'Latvia', 'Lithuania')

--answer:

select sum(population) from world where name in ('Estonia', 'Latvia', 'Lithuania');

--question 6: For each continent show the continent and number of countries.

--answer:

SELECT continent, COUNT(name) AS number_of_countries
FROM world
GROUP BY continent;

--question 7: For each continent show the continent and number of countries with populations of at least 10 million.

--answer:
select continent, count(name) as popAtLeast10Mil from world where population >= '10000000' group by continent;


--question 8: List the continents that have a total population of at least 100 million.

--answer:
select continent from world group by continent having sum(population) >= 100000000;

--QUIZ AFTER TUTORIAL 5

-- question 1: Select the statement that shows the sum of population of all countries in 'Europe'

--answer:

SELECT SUM(population) FROM bbc WHERE region = 'Europe';

-- question 2: Select the statement that shows the number of countries with population smaller than 150000

--answer:

SELECT COUNT(name) FROM bbc WHERE population < 150000;

-- question 3: Select the list of core SQL aggregate functions

--answer:

AVG(), COUNT(), MAX(), MIN(), SUM()

-- question 4: Select the result that would be obtained from the following code:
 SELECT region, SUM(area)
   FROM bbc 
  WHERE SUM(area) > 15000000 
  GROUP BY region


--answer:

No result due to invalid use of the WHERE function

-- question 5: Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'

--answer:

SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- question 6: Select the statement that shows the medium population density of each region

--answer:

SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- question 7: Select the statement that shows the name and population density of the country with the largest population

--answer:

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

-- question 8: Pick the result that would be obtained from the following code:
 SELECT region, SUM(area) 
   FROM bbc 
  GROUP BY region 
  HAVING SUM(area)<= 20000000

--answer:

Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710
