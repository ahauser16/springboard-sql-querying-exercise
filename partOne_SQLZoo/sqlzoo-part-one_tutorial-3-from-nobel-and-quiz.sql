--SELECT from Nobel Tutorial
--1Q Change the query shown so that it displays Nobel prizes for 1950.
--1A 
SELECT yr,
    subject,
    winner
FROM nobel
WHERE yr = 1950;

--2Q Show who won the 1962 prize for literature.
--2A 
SELECT winner
FROM nobel
WHERE yr = 1962
    AND subject = 'literature';

--3Q Show the year and subject that won 'Albert Einstein' his prize.

--3A
select yr, subject from nobel where winner='Albert Einstein';

--4a   Give the name of the 'peace' winners since the year 2000, including 2000.

--4q

select winner from nobel where subject = 'peace' and yr >= '2000';

--5a Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

--5q
SELECT yr, subject, winner FROM nobel WHERE subject = 'literature' AND yr >= 1980 AND yr <= 1989;

--6a Show all details of the presidential winners:
--Theodore Roosevelt
--Thomas Woodrow Wilson
--Jimmy Carter
--Barack Obama

--6q
SELECT * FROM nobel WHERE winner in ('Theodore Roosevelt', 'Thomas Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

--7a Show the winners with first name John

--7q
select winner from nobel where winner like 'John%';

--8q Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.

--8a. 
select yr, subject, winner from nobel where (subject = 'physics' and yr = '1980') or (subject = 'chemistry' and yr = '1984');

--9q Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

--9a
select yr, subject, winner from nobel where yr = '1980' and (subject <> 'chemistry' and subject <> 'medicine');


--10q Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

--10a
select yr, subject, winner from nobel where (subject = 'Medicine' and yr < '1910') or (subject = 'Literature' and yr >= '2004');

--11q Find all details of the prize won by PETER GRÜNBERG.  Non-ASCII characters.  The u in his name has an umlaut. You may find this link useful https://en.wikipedia.org/wiki/%C3%9C#Keyboarding

--11a

SELECT * FROM nobel WHERE winner LIKE 'PETER GR%NBERG';
--or
SELECT * FROM nobel WHERE winner = 'Peter Grünberg';
--or
SELECT * FROM nobel WHERE LOWER(winner) = LOWER('PETER GRÜNBERG');

--12q Find all details of the prize won by EUGENE O'NEILL

--12a
SELECT * FROM nobel WHERE winner = 'Eugene O''Neill';

--13q List the winners, year, and subject where the winner starts with Sir. Show the the most recent first, then by name order.

--13a
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner;

--14q The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.  Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.

--14a
SELECT winner, subject 
FROM nobel
WHERE yr=1984
ORDER BY CASE WHEN subject IN ('physics', 'chemistry') THEN 1 ELSE 0 END, subject, winner;

--QUIZ!!!!

yr	subject	winner
1960	Chemistry	Willard F. Libby
1960	Literature	Saint-John Perse
1960	Medicine	Sir Frank Macfarlane Burnet
1960	Medicine	Peter Medawar
1960	Physics	Donald A. Glaser
1960	Peace	Albert Lutuli
...

--1q Pick the code which shows the name of winner's names beginning with C and ending in n
--1a
SELECT winner FROM nobel  WHERE winner LIKE 'C%' AND winner LIKE '%n';

--2q 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
--2a
SELECT COUNT(subject) FROM nobel WHERE subject = 'Chemistry' AND yr BETWEEN 1950 and 1960;

--3q 3. Pick the code that shows the amount of years where no Medicine awards were given

--3a
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');

--4q Select the result that would be obtained from the following code:

SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%';

--4a
Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet


--5q Select the code which would show the year when neither a Physics or Chemistry award was given:

--5a
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'));

--6q Select the code which shows the years when a Medicine award was given but no Peace or Literature award was

--6a
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace');

--7q Pick the result that would be obtained from the following code:
SELECT subject, COUNT(subject) 
   FROM nobel 
  WHERE yr ='1960' 
  GROUP BY subject;

--7a

Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1


