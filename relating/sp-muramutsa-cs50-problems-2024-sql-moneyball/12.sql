SELECT "first_name", "last_name"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001
    AND ("salaries"."salary" / "performances"."H") IN (
        SELECT "salaries"."salary" / "performances"."H"
        FROM "salaries"
        JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
        WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001
        AND "salaries"."salary" / "performances"."H" > 0
        ORDER BY "salaries"."salary" / "performances"."H"
        LIMIT 10
    )
    AND ("salaries"."salary" / "performances"."RBI") IN (
        SELECT "salaries"."salary" / "performances"."RBI"
        FROM "salaries"
        JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
        WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001
        AND "salaries"."salary" / "performances"."RBI" > 0
        ORDER BY "salaries"."salary" / "performances"."RBI"
        LIMIT 10
    )
ORDER BY "players"."id";

