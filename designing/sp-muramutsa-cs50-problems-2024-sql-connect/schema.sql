CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT UNIQUE,
    "password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "founded" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "connections" (
    "id" INTEGER,
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    "school_id" INTEGER,
    "company_id" INTEGER,
    "start_date" DATE, -- Start date of the connection (mutual connections)
    "end_date" DATE, -- End date of the connection (if applicable)
    "degree_type" VARCHAR(50), -- Type of degree earned/pursued (for school connections)
    "title" VARCHAR(255), -- Title held while affiliated with the company (for company connections)
    PRIMARY KEY("id"),
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
