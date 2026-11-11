-- 01_create_tables.sql
-- Creates all 14 Formula 1 tables. Safe to re-run: drops existing tables first.

DROP TABLE IF EXISTS circuits, constructor_results, constructor_standings, constructors, driver_standings, 
drivers, lap_times, pit_stops, qualifying, races, results, seasons, sprint_results, status;

CREATE TABLE circuits (
	circuitId   INT PRIMARY KEY,
	circuitRef  TEXT,
	name        TEXT,
	location    TEXT,
	country     TEXT,
	lat         NUMERIC,
	lng         NUMERIC,
	alt         INT,
	url         TEXT
);

CREATE TABLE constructor_results (
	constructorResultsId INT PRIMARY KEY,
	raceId               INT,
	constructorId        INT,
	points               NUMERIC,
	status               TEXT
);

CREATE TABLE constructor_standings (
	constructorStandingsId INT PRIMARY KEY,
	raceId                 INT,
	constructorid          INT,
	points                 NUMERIC,
	position               INT,
	positionText           TEXT,
	wins                   INT
);

CREATE TABLE constructors (
	constructorId   INT PRIMARY KEY,
	constructorRef  TEXT,
	name            TEXT,
	nationality     TEXT,
	url             TEXT
);

CREATE TABLE driver_standings (
	driverStandingsId   INT PRIMARY KEY,
	raceId              INT,
	driverId            INT,
	points              NUMERIC,
	position            INT,
	positionText        TEXT,
	wins                INT
);

CREATE TABLE drivers (
	driverId    INT PRIMARY KEY,
	driverRef   TEXT,
	number      INT,
	code        TEXT,
	forename    TEXT,
	surname     TEXT,
	dob         TEXT,
	nationality TEXT,
	url         TEXT
);

CREATE TABLE lap_times (
	raceId          INT,
	driverId        INT,
	lap             INT,
	position        INT,
	time            TEXT,
	milliseconds    INT,
    PRIMARY KEY (raceId, driverId, lap)
);

CREATE TABLE pit_stops (
	raceId          INT,
	driverId        INT,
	stop            INT,
	lap             INT,
	time            TEXT,
	duration        TEXT,
	milliseconds    INT,
    PRIMARY KEY (raceId, driverId, stop)
);

CREATE TABLE qualifying (
	qualifyId       INT PRIMARY KEY,
	raceId          INT,
	driverId        INT,
	constructorId   INT,
	number          INT,
	position        INT,
	q1              TEXT,
	q2              TEXT,
	q3              TEXT
);

CREATE TABLE races (
    raceId      INT PRIMARY KEY,
    year        INT,
    round       INT,
    circuitId   INT,
    name        TEXT,
    date        DATE,
    time        TIME,
    url         TEXT,
    fp1_date    DATE, fp1_time    TIME,
    fp2_date    DATE, fp2_time    TIME,
    fp3_date    DATE, fp3_time    TIME,
    quali_date  DATE, quali_time  TIME,
    sprint_date DATE, sprint_time TIME
);

CREATE TABLE results (
    resultId        INT PRIMARY KEY,
    raceId          INT,
    driverId        INT,
    constructorId   INT,
    number          INT,
    grid            INT,
    position        INT,
    positionText    TEXT,
    positionOrder   INT,
    points          NUMERIC,
    laps            INT,
    time            TEXT,
    milliseconds    INT,
    fastestLap      INT,
    rank            INT,
    fastestLapTime  TEXT,
    fastestLapSpeed NUMERIC,
    statusId        INT
);

CREATE TABLE seasons (
	year INT PRIMARY KEY,
	url  TEXT
);

CREATE TABLE sprint_results (
    resultId       INT PRIMARY KEY,
    raceId         INT,
    driverId       INT,
    constructorId  INT,
    number         INT,
    grid           INT,
    position       INT,
    positionText   TEXT,
    positionOrder  INT,
    points         NUMERIC,
    laps           INT,
    time           TEXT,
    milliseconds   INT,
    fastestLap     INT,
    fastestLapTime TEXT,
    statusId       INT
);

CREATE TABLE status (
    statusId INT PRIMARY KEY,
    status   TEXT
);