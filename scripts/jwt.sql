CREATE TYPE usersforumpublic.jwt AS (
    role TEXT,
    exp INTEGER,
    email TEXT,
    is_admin BOOLEAN
);