-- Active: 1747592879333@@127.0.0.1@5432@postgres
-- create table rangers
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region TEXT NOT NULL
);
-- create table species
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(75) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);
-- create table sightings
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NOT NULL REFERENCES rangers (ranger_id),
    species_id INTEGER NOT NULL REFERENCES species (species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(50) NOT NULL,
    notes TEXT
);

-- drop table
-- Drop Table table_name;

-- insert data rangers table..
INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );

-- insert data species table..
INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );
-- insert data sightings table..
INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

-- show data tables
SELECT * FROM rangers;

SELECT * FROM species;

SELECT * FROM sightings;

-- Query-- 1. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-- Query-- 2. Count unique species ever sighted.
SELECT COUNT(DISTINCT (species_id)) AS unique_species_count
FROM sightings;

-- Query-- 3. Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location LIKE '%Pass%';

-- Query-- 4. List each ranger's name and their total number of sightings.
SELECT name, count(sighting_id) AS total_sightings
FROM rangers AS r
    LEFT JOIN sightings AS s ON r.ranger_id = s.ranger_id
GROUP BY (r.name);

-- Query-- 5. List species that have never been sighted.
SELECT s1.common_name
FROM species AS s1
    LEFT JOIN sightings AS s2 ON s1.species_id = s2.species_id
WHERE
    s2.species_id IS NULL;

-- Query-- 6. Show the most recent 2 sightings.

SELECT sp.common_name, si.sighting_time, r.name
FROM
    sightings AS si
    INNER JOIN species AS sp ON sp.species_id = si.species_id
    INNER JOIN rangers as r ON r.ranger_id = si.ranger_id
ORDER BY si.sighting_time DESC
LIMIT 2;

-- Query-- 7. Update all species discovered before year 1800 to have status 'Historic'.

-- SELECT * FROM species;
-- SELECT extract(YEAR FROM discovery_date) FROM species;
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    extract(
        YEAR
        FROM discovery_date
    ) < 1800;

-- Query-- 8. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.

-- SELECT extract( HOUR FROM sighting_time ) FROM sightings;

SELECT
    sighting_id,
    CASE
        WHEN extract(
            HOUR
            FROM sighting_time
        ) < 12 THEN 'Morning'
        WHEN extract(
            HOUR
            FROM sighting_time
        ) >= 12
        AND extract(
            HOUR
            FROM sighting_time
        ) <= 17 THEN 'Afternoon'
        WHEN extract(
            HOUR
            FROM sighting_time
        ) > 17 THEN 'Evening'
    END AS time_of_day
FROM sightings;

-- Query-- 9. Delete rangers who have never sighted any species.

-- SELECT DISTINCT ranger_id from sightings;
-- SELECT * FROM rangers;
-- SELECT * from sightings;
DELETE FROM rangers
WHERE
    ranger_id NOT IN (
        SELECT DISTINCT
            ranger_id
        from sightings
    )