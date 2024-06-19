SELECT "city", COUNT("id")
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING COUNT("type") <= 3
ORDER BY COUNT("type") DESC, "city";
