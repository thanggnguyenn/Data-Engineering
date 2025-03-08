-- taxi data columns: VendorID, tpep_pickup_datetime, tpep_dropoff_datetime, passenger_count, trip_distance, RatecodeID,
-- store_and_fwd_flag, PULocationID, DOLocationID, payment_type, fare_amount, extra, mta_tax, tip_amount, tolls_amount, improvement_surcharge,
-- total_amount, congestion_surcharge, Airport_fee
 
-- taxi zone lookup: LocationID, Borough, Zone, service_zone


-- Joining yellow taxi table with the zone lookup (inner join)
-- 1st of inner join
SELECT
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    total_amount,
    CONCAT(zpu."Borough", ' / ', zpu."Zone") AS "pickup_loc",
    CONCAT(zdo."Borough", ' / ', zdo."Zone") AS "dropoff_loc",
FROM 
    yellow_taxi_trips t,
    zones zpu,
    zones zdo,
WHERE
    t."PULocationID" = zpu."LocationID" AND
    t."DOLocationID" = zdo."LocationID"


-- 2nd of inner join
SELECT
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    total_amount,
    CONCAT(zpu."Borough", ' / ', zpu."Zone") AS "pickup_loc",
    CONCAT(zdo."Borough", ' / ', zdo."Zone") AS "dropoff_loc",
FROM 
    yellow_taxi_trips t JOIN zones zpu
        ON t."PULocationID" = zpu."LocationID"
    JOIN zones zdo
        ON t."DOLocationID" = zdo."LocationID"


-- check for location id not in the zone table
SELECT
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    total_amount,
    "PULocationID",
    "DOLocationID"
FROM 
    yellow_taxi_trips t
WHERE
    "PULocationID" is NULL

-- check for location id in the zone table not in yellow taxi table
SELECT
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    total_amount,
    "PULocationID",
    "DOLocationID"
FROM 
    yellow_taxi_trips t
WHERE
    "DOLocationID" NOT IN (SELECT "LocationID" FROM zones)

-- execute this query before doing the above query.
-- result: we see that DOLocationID = 142 in the output of the query
DELETE FROM zones WHERE "LocationID" = 142;

-- we will use left, right and outer joins when some Location IDs are not in either tables
-- LEFT JOIN: when a record in the left table (yellow_taxi_trips) but not present in the right table (zones), you still want to see it
-- RIGHT JOIN: the opposite of LEFT JOIN
-- OUTER JOIN: combination of LEFT and RIGHT JOIN
SELECT
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    total_amount,
    CONCAT(zpu."Borough", ' / ', zpu."Zone") AS "pickup_loc",
    CONCAT(zdo."Borough", ' / ', zdo."Zone") AS "dropoff_loc",
FROM 
    yellow_taxi_trips t LEFT JOIN zones zpu
        ON t."PULocationID" = zpu."LocationID"
    LEFT JOIN zones zdo
        ON t."DOLocationID" = zdo."LocationID"

-- group query
-- example query: DATE_TRUNC('DAY', tpep_dropoff_datetime),
SELECT 
    CAST(tpep_dropoff_datetime AS DATE) as "day", -- 1
    "DOLocationID" -- 2
    COUNT(1) as "count",
    MAX(total_amount),
    MAX(passenger_count)
FROM 
    yellow_taxi_trips t
GROUP BY
    CAST(tpep_dropoff_datetime AS DATE)
    1, 2
ORDER BY "day" ASC;
ORDER BY "count" DESC;
ORDER BY "day" ASC,
         "DOLocationID" ASC;
         

