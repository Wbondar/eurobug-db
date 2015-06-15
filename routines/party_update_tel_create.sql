DELIMITER ENDROUTINE
CREATE PROCEDURE party_update_tel_create
(
      IN  arg_party_id  ${PARTY_ID_TYPE}
    , IN  arg_tel_value ${PHONE_NUMBER_VALUE_TYPE}
    , OUT arg_tel_id    ${PHONE_NUMBER_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    CALL tel_create (arg_tel_value, arg_tel_id)
    ;
    INSERT INTO party_phone_number (party_id, phone_number_id) VALUES
    (arg_party_id, arg_tel_id)
    ;
END
ENDROUTINE
DELIMITER ;
