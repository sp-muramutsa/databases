SELECT "first_name", "last_name"
FROM "players"
WHERE strftime('%Y', "final_game") = '2022'
GROUP BY "first_name", "last_name";
