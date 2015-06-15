DELIMITER ENDROUTINE
/* TODO: Make the following procedure work. */
CREATE PROCEDURE email_create
(
      IN  arg_email_address ${EMAIL_ADDRESS_TYPE} 
    , OUT arg_email_id      ${EMAIL_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    SELECT SUBSTRING_INDEX(arg_email_address,'@',-1) AS email_domain INTO @var_email_domain_value
    ;
    SELECT email_domain.id INTO @var_email_domain_id
    FROM email_domain 
    WHERE LOWER(email_domain.value) = LOWER(@var_email_domain_value) 
    ;
    IF @var_email_domain_id IS NULL THEN
        CALL nextval ('seq_email_domain_id', @var_email_domain_id)
        ;
        INSERT INTO email_domain (id, value) VALUES
        (@var_email_domain_id, @var_email_domain_value)
        ;
        CALL setval ('seq_email_domain_id', @var_email_domain_id)
        ;
    END IF
    ;
    CALL nextval ('seq_email_address_id', @var_email_address_id)
    ;
    SELECT LEFT(arg_email_address, LOCATE('@', arg_email_address) - 1) as local INTO @var_email_local_value
    ;
    INSERT INTO email_address (domain_id, id, local) VALUES
    (@var_domain_id, @var_email_address_id, @var_email_local_value)
    ;
    CALL setval ('seq_email_address_id', @var_email_address_id)
    ;
    SELECT @var_email_address_id INTO arg_email_id
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
