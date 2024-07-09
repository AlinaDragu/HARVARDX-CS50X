-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT description
FROM crime_scene_reports
WHERE description LIKE '%10:15am%' AND month = 7 AND day = 28 AND description LIKE '%bakery%' AND street = 'Humphrey Street' AND description LIKE '%interviews were conducted%' AND description LIKE '%witnesses%';

-- the interviews
SELECT transcript
FROM interviews
WHERE transcript LIKE '%thief%' OR transcript LIKE '%stole%' OR transcript LIKE '%robbery%' OR transcript LIKE '%CS50 duck%' OR transcript LIKE '%Humphrey Street%';

-- the backery security
SELECT year, month, day, hour, minute, activity, license_plate
FROM bakery_security_logs
WHERE year = 2023 AND month = 7 AND day = 28 AND hour >= 10 AND hour < 11;

--licence plates
SELECT p.name, bsl.activity, bsl.license_plate, bsl.year, bsl.month, bsl.day, bsl.hour, bsl.minute
FROM bakery_security_logs bsl
JOIN people p ON p.license_plate = bsl.license_plate
WHERE bsl.year = 2021 AND bsl.month = 7 AND bsl.day = 28 bsl.hour = 10 AND bsl.minute BETWEEN 15 AND 25;

--atm transactions
SELECT year, month, day, atm_location, transaction_type, amount
FROM atm_transaction = 'Leggett Street'
WHERE year = 2023 AND month = 7 AND day = 28;

--name of withdraws from atm
SELECT a.*, p.name
FROM atm_transactions a
JOIN bank_accounts b ON a.account_number = b.account_number
JOIN people p ON b.person_id = p.id
WHERE a.atm_location = 'Leggett Street' AND a.year = 2021 AND a.month = 7 AND a.day = 28 AND a.transaction_type = 'withdraw';

--total number of phone calls
SELECT COUNT(*) AS total_calls
FROM phone_calls;

-- number of calls made by each caller
SELECT caller, COUNT(*) AS num_calls_made
FROM phone_calls
GROUP BY caller;

-- number of calls made by each receiver
SELECT receiver, COUNT(*) AS num_calls_received
FROM phone_calls
GROUP BY receiver;

-- duration of calls made by each caller
SELECT caller, SUM(duration) AS total_duration
FROM phone_calls
GROUP BY caller;

-- average duration of calls by month
SELECT month, AVG(duration) AS avg_duration
FROM phone_calls
GROUP BY month;

--longest call
SELECT *
FROM phone_calls
ORDER BY duration DESC
LIMIT 1;

--witness 3 phone call investigation
SELECT *
FROM phone_calls
WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60;

--add names to call list of callers
SELECT p.name, pc.caller, pc.receiver, pc.month, pc.day, pc.duration
FROM phone_calls pc
JOIN people p ON pc.caller = p.phone_number
WHERE pc.year = 2021 AND pc.month = 7 AND pc.day = 28 AND pc.duration < 60;

--explore airport to find ffityville
SELECT * FROM airports;

--explore flights out
SELECT f.*, origin.full_name AS origin_airport, destination.full_name AS destination_airport
FROM flights f
JOIN airports origin ON f.origin_airport_id = origin.id
JOIN airports destination ON f.destination_airport_id = destination.id
WHERE origin.id = 8 AND f.year = 2021 AND f.month = 7 AND f.day = 29
ORDER BY f.hour, f.minute;

--combine info from all 3 testimonies
SELECT p.name
FROM bakery_security_logs bsl
JOIN people p ON p.license_plate = bsl.license_plate
JOIN bank_accounts ba ON ba.person_id = p.id
JOIN atm_transactions at ON account_number = ba.account_number
JOIN phone_calls pc ON pc.caller = p.phone_number
WHERE bsl.year = 2021 AND bsl.month = 7 AND bsl.day = 28 AND bsl.hour = 10 AND bsl.minute BETWEEN 15 AND 25
AND at.atm_location = 'Leggett Street' AND at.year = 2021 AND at.month = 7 AND at.day = 28 AND at.transation_type = 'withdraw'
AND pc.year = 2021 AND pc.month = 7 AND pc.day = 28 AND pc.duration < 60;

--bruce or diana , who is on flight
SELECT p.name
FROM people.p
JOIN passengers ps ON p.passport_number = ps.passport_number
WHERE ps.flight_id = 36
AND p.name IN ('Bruce','Diana');

--who did bruce call
SELECT p2.name AS receiver
FROM phone_calls pc
JOIN people p1 ON pc.caller = p1.phone_number
JOIN people p2 ON pc.receiver = p2.phone_number
WHERE p1.name = 'Bruce' AND pc.year = 2021 AND pc.month = 7 AND pc.day = 28 AND pc.duration < 60;