SELECT
    EXTRACT(week FROM flights.departure_time) AS week_number,
    COUNT(ticket_flights.ticket_no) AS ticket_amount,
    EXTRACT(week FROM festivals.festival_date) AS festival_week,
    festivals.festival_name AS festival_name
FROM
    flights LEFT JOIN ticket_flights ON flights.flight_id = ticket_flights.flight_id
    LEFT JOIN airports ON flights.arrival_airport = airports.airport_code
    LEFT JOIN festivals ON airports.city = festivals.festival_city AND EXTRACT(week FROM flights.departure_time) = EXTRACT(week FROM festivals.festival_date)
WHERE
    airports.city = 'Москва'
    --AND festivals.festival_city = 'Москва'
    AND (flights.departure_time :: DATE) BETWEEN '2018-07-23' AND '2018-09-30'
GROUP BY 
    week_number,
    festival_week,
    festival_name
ORDER BY week_number