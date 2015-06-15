DELIMITER ENDROUTINE
CREATE PROCEDURE party_update_email_create_with_domain
(
      IN  arg_party_id         ${PARTY_ID_TYPE}
    , IN  arg_email_local      ${EMAIL_ADDRESS_TYPE}
    , IN  arg_email_domain     ${EMAIL_DOMAIN_VALUE_TYPE}
    , OUT arg_email_address_id ${EMAIL_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    CALL email_create_with_domain (arg_email_local, arg_email_domain, arg_email_address_id)
    ;
    INSERT INTO party_email_address (party_id, email_address_id) VALUES
    (arg_party_id, arg_email_address_id)
    ;
END
ENDROUTINE
DELIMITER ;
