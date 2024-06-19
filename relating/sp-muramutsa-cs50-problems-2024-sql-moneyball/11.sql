SELECT "players"."first_name", "players"."last_name", ("salaries"."salary" / "performances"."H") AS "dollars per hit" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "performances"."H" > 0
    AND "salaries"."year" = 2001
    AND "performances"."year" = 2001
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10;


