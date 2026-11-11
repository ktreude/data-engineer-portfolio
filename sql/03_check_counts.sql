-- 03_check_counts.sql
-- Compares loaded row counts to the source CSV row counts (header row excluded).
-- Every row should say OK.
 
SELECT table_name, actual, expected,
       CASE WHEN actual = expected THEN 'OK' ELSE 'MISMATCH' END AS check_result
FROM (
    SELECT 'circuits' AS table_name, COUNT(*) AS actual, 77 AS expected FROM circuits
    UNION ALL SELECT 'constructor_results', COUNT(*), 12625 FROM constructor_results
    UNION ALL SELECT 'constructor_standings', COUNT(*), 13391 FROM constructor_standings
    UNION ALL SELECT 'constructors', COUNT(*), 212 FROM constructors
    UNION ALL SELECT 'driver_standings', COUNT(*), 34863 FROM driver_standings
    UNION ALL SELECT 'drivers', COUNT(*), 861 FROM drivers
    UNION ALL SELECT 'lap_times', COUNT(*), 589081 FROM lap_times
    UNION ALL SELECT 'pit_stops', COUNT(*), 11371 FROM pit_stops
    UNION ALL SELECT 'qualifying', COUNT(*), 10494 FROM qualifying
    UNION ALL SELECT 'races', COUNT(*), 1125 FROM races
    UNION ALL SELECT 'results', COUNT(*), 26759 FROM results
    UNION ALL SELECT 'seasons', COUNT(*), 75 FROM seasons
    UNION ALL SELECT 'sprint_results', COUNT(*), 360 FROM sprint_results
    UNION ALL SELECT 'status', COUNT(*), 139 FROM status
) counts
ORDER BY table_name;