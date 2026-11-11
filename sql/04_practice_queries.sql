-- SELECT Exercises

-- 1. Show the name, country and location of every circuit.
SELECT name, country, location
FROM circuits;

-- 2. Show the first and last name (forename, surname) and date of birth (dob) of every driver.
SELECT forename, surname, dob
FROM drivers;

-- 3. List each distinct nationality in the constructors table, with no repeats.
SELECT DISTINCT nationality
FROM constructors;

-- WHERE Exercises

-- 4. Show the name and date of every race in 2008.
SELECT name, date
FROM races
WHERE year = 2008;

-- 5. Find all drivers born after January 1, 1995.
SELECT forename, surname, dob
FROM drivers
WHERE dob > '1995-01-01';

-- 6. Find the raceId of the 2021 Monaco Grand Prix in races. 
-- Then, in a second query, pull that race’s rows from results, showing positionOrder, driverId and points.
SELECT raceId
FROM races
WHERE name = 'Monaco Grand Prix' AND year = 2021;

SELECT positionOrder, driverId, points
FROM results
WHERE raceId = 1056;

-- 7. Show circuits located in Italy or Japan.
SELECT name, country, location
FROM circuits
WHERE country IN ('Italy', 'Japan');

-- GROUP BY Exercises

-- 8. Count the number of races held in each year.
SELECT year, COUNT(*) AS race_count
FROM races
GROUP BY year;

-- 9. Count the number of drivers per nationality.
SELECT nationality, COUNT(*) AS nationality_count
FROM drivers
GROUP BY nationality;

-- 10. Find the total points per driverId in the results table.
SELECT driverId, SUM(points) AS total_points
FROM results
GROUP BY driverId;

-- 11. Count how many results rows exist for each statusId, keeping only statuses that appear more than 100 times.
SELECT statusId, COUNT(*) AS result_count
FROM results
GROUP BY statusId 
HAVING COUNT(*) > 100;

-- ORDER BY Exercises

-- 12. Show the 10 most recent races by date, newest first.
SELECT name, date
FROM races
ORDER BY date DESC
LIMIT 10;

-- 13. Show the 10 oldest drivers by dob, earliest birth date first.
SELECT forename, surname, dob
FROM drivers
ORDER BY dob ASC
LIMIT 10;

-- 14. Find the 10 drivers with the most race wins.
SELECT driverId, COUNT(*) AS total_wins
FROM results
WHERE position = 1
GROUP BY driverId
ORDER BY total_wins DESC
LIMIT 10;

-- 15. Show the 10 fastest single laps ever recorded in lap_times, using the milliseconds column.
SELECT driverId, raceId, milliseconds
FROM lap_times
ORDER BY milliseconds ASC
LIMIT 10;

-- 16. Which circuits have hosted the most races?
SELECT circuitId, COUNT(*) AS total_races
FROM races
GROUP BY circuitId
ORDER BY total_races DESC
LIMIT 10;