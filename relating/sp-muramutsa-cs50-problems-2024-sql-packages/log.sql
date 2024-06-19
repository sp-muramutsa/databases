
-- *** The Lost Letter ***
SELECT "type", "address"
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "action" = 'Drop' AND "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE "address" = '900 Somerville Avenue')
            AND "to_address_id"= (
            SELECT "id"
            FROM "addresses"
            WHERE "address" LIKE '%Finn%')
    )
);

-- *** The Devious Delivery ***
SELECT "type"
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "action" = 'Drop' AND "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);

SELECT "contents"
FROM "packages"
WHERE "from_address_id" IS NULL;

-- *** The Forgotten Gift ***
SELECT *
FROM "scans"
WHERE "package_id" = (
    SELECT "id"
    FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" LIKE '%109 Tileston Street%'
    )
    AND "to_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" LIKE '%728 Maple Place%'
    )
);

SELECT name
FROM "drivers"
WHERE "id" = 17;
