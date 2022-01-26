// Question 3: Count records *
// How many taxi trips were there on January 15

SELECT COUNT(1)
FROM yellow_taxi_data
WHERE extract(day from tpep_pickup_datetime)=15;

// Question 4: Largest tip for each day *
// On which day it was the largest tip in January? (note: it's not a typo, it's "tip", not "trip")

SELECT tpep_pickup_datetime, tip_amount
FROM yellow_taxi_data
ORDER BY tip_amount DESC
LIMIT 1;

// Question 5: Most popular destination *
// What was the most popular destination for passengers picked up in central park on January 14? Enter the zone name (not id). If the zone name is unknown (missing), write "Unknown"

SELECT zdo."Zone", COUNT(1)
FROM yellow_taxi_data t LEFT JOIN zones zpu
ON t."PULocationID"=zpu."LocationID"
LEFT JOIN zones zdo
ON t."DOLocationID"=zdo."LocationID"
WHERE extract(month from tpep_pickup_datetime)=1 AND extract(day from tpep_pickup_datetime)=14 AND extract(day from tpep_pickup_datetime)=14 AND zpu."Zone"='Central Park'
GROUP BY zdo."Zone"
ORDER BY count DESC;

// Question 6: Most expensive route *
// What's the pickup-dropoff pair with the largest average price for a ride (calculated based on total_amount)? Enter two zone names separated by a slashFor example:"Jamaica Bay / Clinton East"If any of the zone names are unknown (missing), write "Unknown". For example, "Unknown / Clinton East"

SELECT zpu."Zone", zdo."Zone", AVG(total_amount) AS avg_mount
FROM yellow_taxi_data t LEFT JOIN zones zpu
ON t."PULocationID"=zpu."LocationID"
LEFT JOIN zones zdo
ON t."DOLocationID"=zdo."LocationID"
GROUP BY zpu."Zone", zdo."Zone"
ORDER BY avg_mount DESC
LIMIT 5;