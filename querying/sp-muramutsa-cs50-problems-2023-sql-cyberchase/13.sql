SELECT strftime('%Y', "air_date") AS "year", MIN("air_date") AS "first_day"
FROM "episodes"
GROUP BY "year";

