SELECT  "first_name", "last_name","birth_state", "debut" AS "Top 10 Most Recent Californian Recruits"
FROM "players"
WHERE "birth_state" = 'CA'
ORDER BY "debut" DESC, "first_name", "last_name"
LIMIT 10;

