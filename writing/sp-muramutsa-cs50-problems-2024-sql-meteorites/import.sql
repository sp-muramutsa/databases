-- create temporary table
CREATE TABLE "meteorites_temp" (
    "name",
    "id",
    "nametype",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
);


-- import csv in temporary table
.import --csv --skip 1 meteorites.csv meteorites_temp

-- clean the data in the temporary table
-- 1. Nullify CSV NULL values
UPDATE meteorites_temp
SET
    "mass" = NULLIF("mass", ''),
    "year" = NULLIF("year", ''),
    "lat" = NULLIF("lat", ''),
    "long" = NULLIF("long", '');

-- 2. Round to 2 d.p.
UPDATE "meteorites_temp"
SET
    "mass" = ROUND("mass", 2),
     "lat" = ROUND("lat", 2),
     "long" = ROUND("long", 2);

-- 3. Remove "Relict" nametype
DELETE FROM meteorites_temp
WHERE "nametype" = "Relict";

-- 4. The meteorites are sorted by year, oldest to newest, and then—if any two meteorites landed in the same year—by name, in alphabetical order.
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" DATE,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
FROM "meteorites_temp"
ORDER BY "year", "name";
