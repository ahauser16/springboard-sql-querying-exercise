--Codewars SQL QUESTIONS:
--question 1:
-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table WHERE their age is over 50.  You should return all people fields where their age is over 50 and order by the age descending.

-- people table schema
-- id
-- name
-- age

--answer:
select *
from people
where age > '50'
order by age desc;

--quesiton 2:
--For this challenge you need to create a simple SUM statement that will sum all the ages.

-- people table schema
-- id
-- name
-- age
-- select table schema
-- age_sum (sum of ages)
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
-- NOTE2: You need to use ALIAS for creating age_sum

--answer: 
SELECT SUM(age) AS age_sum FROM people;

--question 3: 
-- For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people.

-- people table schema
-- id
-- name
-- age
-- select table schema
-- age_min (minimum of ages)
-- age_max (maximum of ages)
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

--answer: 
SELECT MIN(age) AS age_min, MAX(age) AS age_max FROM people;

--question 4:
-- Create a simple SELECT query to display student information of all ACTIVE students.

-- TABLE STRUCTURE:

-- students
-- Id (integer)	FirstName (text)	LastName (text)	IsActive (boolean)

-- Note:

-- IsActive (true = 1 or false = 0)
-- see specification: Datatypes In SQLite

--answer:
SELECT * FROM students WHERE IsActive = 1;

--question 5: For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.

-- people table schema
-- id
-- name
-- age
-- select table schema
-- age [group by]
-- people_count (people count)

--answer:
SELECT age, COUNT(*) AS people_count FROM people GROUP BY age;

--question 6: For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age and return the groups with 10 or more people who have that age.

-- people table schema
-- id
-- name
-- age
-- return table schema
-- age
-- total_people

--answer:
SELECT age, COUNT(*) AS total_people FROM people GROUP BY age HAVING COUNT(*) >= 10;

