-- Active: 1747592879333@@127.0.0.1@5432@postgres
SHOW timezone;

SELECT now();

CREATE Table timez(ts TIMESTAMP without TIME zone, tsz TIMESTAMP with TIME zone);

INSERT into timez VALUES('2024-01-12 11:30:00', '2024-01-12 11:30:00');
SELECT * FROM timez;

SELECT CURRENT_DATE;

SELECT current_time;

SELECT now():: time;

SELECT to_char(now(), 'dd/mm/yyyy');

SELECT CURRENT_DATE - INTERVAL'1 days';

SELECT age(CURRENT_DATE, '1998-09-18');


SELECT extract(YEAR FROM '2002-02-02':: date);
SELECT extract(MONTH FROM '2002-02-02':: date);
SELECT extract(DAY FROM '2002-02-02':: date);

-- casting..
SELECT '0':: BOOLEAN;