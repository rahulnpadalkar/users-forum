CREATE OR REPLACE FUNCTION usersforumpublic.register_user(
    email TEXT,
    password TEXT,
    first_name TEXT,
    last_name TEXT
) RETURNS usersforumpublic.users AS $$
DECLARE userid uuid;
        reg_user usersforumpublic.users;
BEGIN
    INSERT INTO usersforumpublic.users(email, first_name, last_name) VALUES ($1, $3, $4) RETURNING * INTO reg_user;
    INSERT INTO usersforumprivate.accounts(email, user_id, password) VALUES ($1, reg_user.id, crypt($2, gen_salt('bf')));
    RETURN reg_user;
END;
$$ LANGUAGE PLPGSQL VOLATILE SECURITY DEFINER;
