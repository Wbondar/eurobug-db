DELIMITER ENDROUTINE
CREATE PROCEDURE email_create_with_domain
(
      IN  arg_email_local      ${EMAIL_LOCAL_VALUE_TYPE}
    , IN  arg_email_domain     ${EMAIL_DOMAIN_VALUE_TYPE}
    , OUT arg_email_address_id ${EMAIL_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    CALL nextval ('seq_email_address_id', @var_email_address_id)
    ;
    SELECT id INTO @var_email_domain_id
    FROM email_domain 
    WHERE LOWER(value) = LOWER(arg_email_domain)
    ;
    IF @var_email_domain_id IS NULL THEN
        CALL nextval ('seq_email_domain_id', @var_email_domain_id)
        ;
        INSERT INTO email_domain (id, value) VALUES
        (@var_email_domain_id, arg_email_domain)
        ;
        SELECT id INTO @var_email_domain_id
        FROM email_domain
        WHERE id = @var_email_domain_id
            AND LOWER(value) = LOWER(arg_email_domain)
        ;
        CALL setval ('seq_email_domain_id', @var_email_domain_id)
        ;
    END IF
    ;
    INSERT INTO email_address (id, domain_id, local) VALUES
    (@var_email_address_id, @var_email_domain_id, arg_email_local)
    ;
    SELECT id INTO arg_email_address_id
    FROM email_address 
    WHERE id = @var_email_address_id
        AND domain_id = @var_email_domain_id 
        AND local = arg_email_local
    ;
    CALL setval ('seq_email_address_id', arg_email_address_id)
    ;
END
ENDROUTINE
DELIMITER ;
