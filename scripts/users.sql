CREATE TABLE IF NOT EXISTS usersforumpublic.users(
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE CHECK (email ~ '^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$'),
    created_on TIMESTAMP NOT NULL DEFAULT NOW()
);