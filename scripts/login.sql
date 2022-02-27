CREATE OR REPLACE FUNCTION usersforumpublic.login(
    email TEXT,
    password TEXT
) RETURNS usersforumpublic.jwt AS $$
DECLARE account usersforumprivate.accounts;
BEGIN
    SELECT * INTO account FROM usersforumprivate.accounts WHERE usersforumprivate.accounts.email = $1;
    IF account.password = crypt($2, account.password) then
        return(
            'reg_user',
            extract(epoch from now() + interval '15 days'),
            account.email,
            FALSE
        )::usersforumpublic.jwt;
    ELSE
        return NULL;
    END IF;
END;
$$ LANGUAGE PLPGSQL SECURITY DEFINER;
