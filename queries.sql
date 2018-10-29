/*
Lists the distinct flight numbers of all flights from Seattle to Boston by Alaska
Airlines Inc. on Mondays with the output column title being 'flight_num'.
*/
SELECT DISTINCT f.flight_num AS flight_num
FROM FLIGHTS AS f, CARRIERS AS c, WEEKDAYS AS w
WHERE f.carrier_id = c.cid
AND c.name = 'Alaska Airlines Inc.'
AND f.origin_city = 'Seattle WA'
AND f.dest_city = 'Boston MA'
AND f.day_of_week_id = w.did
AND w.day_of_week = 'Monday';

/*
Finds all itineraries from Seattle to Boston on July 15th. Searches only for
itineraries that have one stop (i.e., flight 1: Seattle -> [somewhere],
flight2: [somewhere] -> Boston). Both flights must depart on the same day
(same day here means the date of flight) and must be with the same carrier.

The itineraries include the name of the carrier, the first flight number, the
origin and destination of that first flight, the flight time, the second flight
number, the origin and destination of the second flight, the second flight time,
and finally the total flight time.
*/
SELECT c.name AS name,
f1.fid AS f1_flight_num,
f1.origin_city AS f1_origin_city,
f1.dest_city AS f1_dest_city,
f1.actual_time AS f1_actual_time,
f2.flight_num AS f2_flight_num,
f2.origin_city AS f2_origin_city,
f2.dest_city AS f2_dest_city,
f2.actual_time AS f2_actual_time,
f1.actual_time + f2.actual_time AS actual_time
FROM FLIGHTS as f1, FLIGHTS as f2 JOIN CARRIERS as c ON f2.carrier_id=c.cid
WHERE f1.origin_city='Seattle WA'
AND f1.carrier_id=f2.carrier_id
AND f2.dest_city='Boston MA'
AND f1.dest_city=f2.origin_city
AND f1.month_id=f2.month_id
AND f1.day_of_month=f2.day_of_month
AND f1.month_id=7
AND f1.day_of_month=15
AND f1.actual_time + f2.actual_time < 420;

/*
Finds the day of the week with the longest average arrival delay.
Return the name of the day and the average delay with output columns titled:
`day_of_week` and `delay`, in that order.
*/
SELECT w.day_of_week as day_of_week, avg(arrival_delay) as delay
FROM FLIGHTS as f, WEEKDAYS as w
WHERE f.day_of_week_id=w.did
GROUP BY w.day_of_week
ORDER BY avg(arrival_delay) DESC
LIMIT 1;

/*
Finds the names of all distinct airlines that ever flew more than 1000 flights
in one day (i.e., a specific day/month, but not any 24-hour period).
*/
SELECT DISTINCT c.name AS name
FROM FLIGHTS AS f JOIN CARRIERS AS c ON f.carrier_id=c.cid
GROUP BY c.name, f.month_id, f.day_of_month
HAVING count(*) > 1000;
