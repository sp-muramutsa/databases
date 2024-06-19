SELECT "english_title", "brightness" AS "Least Brightest Fuji Titled"
FROM "views"
WHERE "english_title" LIKE '%Fuji%'
ORDER BY "brightness"
LIMIT 1;
