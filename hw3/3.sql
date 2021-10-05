SELECT * FROM flights
JOIN airports_data AS ad1

ON flights.departure_airport = ad1.airport_code

JOIN airports_data AS ad2

ON flights.arrival_airport = ad2.airport_code

WHERE ad1.timezone = ad2.timezone 
AND ad1.timezone = 'Asia/Yakutsk';