SELECT * FROM flights 
WHERE ("departure_airport" = 'SVO'
 OR "departure_airport" = 'VKO'
OR "departure_airport" = 'DME')
 and "actual_departure" 
 BETWEEN '2017-08-06 12:00:00+03'
  AND '2017-08-06 12:25:00+03'
 AND "actual_departure" IS NOT NULL;