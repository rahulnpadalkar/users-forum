CREATE TABLE IF NOT EXISTS usersforumprivate.accounts(
    id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id uuid NOT NULL REFERENCES usersforumpublic.users ON DELETE CASCADE,
    email TEXT NOT NULL UNIQUE CHECK (email ~ '^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$'),
    password TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL  DEFAULT NOW()
);