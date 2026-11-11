-- 02_load_data.sql
-- Loads all 14 CSVs. Safe to re-run: empties the tables first so rows are never doubled.
-- Before running: copy every CSV into the container, e.g.
--   docker cp races.csv my-postgres:/tmp/races.csv

TRUNCATE TABLE circuits, constructor_results, constructor_standings, constructors, driver_standings, drivers, 
lap_times, pit_stops, qualifying, races, results, seasons, sprint_results, status;

COPY circuits
FROM '/tmp/circuits.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY constructor_results
FROM '/tmp/constructor_results.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY constructor_standings
FROM '/tmp/constructor_standings.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY constructors
FROM '/tmp/constructors.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY driver_standings
FROM '/tmp/driver_standings.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY drivers
FROM '/tmp/drivers.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY lap_times
FROM '/tmp/lap_times.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY pit_stops
FROM '/tmp/pit_stops.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY qualifying
FROM '/tmp/qualifying.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY races
FROM '/tmp/races.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY results
FROM '/tmp/results.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY seasons
FROM '/tmp/seasons.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY sprint_results
FROM '/tmp/sprint_results.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');

COPY status
FROM '/tmp/status.csv'
WITH (FORMAT CSV, HEADER TRUE, NULL '\N');