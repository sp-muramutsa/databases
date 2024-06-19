SELECT "first_name", "last_name", "salaries"."salary", "salaries"."year", "performances"."HR" FROM "players"
JOIN "performances" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
WHERE "performances"."year" = "salaries"."year"
ORDER BY "players"."id", "salaries"."year" DESC, "performances"."HR" DESC, "salaries"."year" DESC;
