DELIMITER ENDROUTINE
CREATE PROCEDURE tel_create
(
      IN  arg_tel_value ${PHONE_NUMBER_VALUE_TYPE}
    , OUT arg_tel_id    ${PHONE_NUMBER_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    CALL nextval ('seq_phone_number_id', @var_tel_id)
    ;
    INSERT INTO phone_number (id, value) VALUES
    (@var_tel_id, arg_tel_value)
    ;
    SELECT id INTO arg_tel_id
    FROM phone_number 
    WHERE id = @var_tel_id 
    	AND value = arg_tel_value
    ;
    CALL setval ('seq_phone_number_id', arg_tel_id)
    ;
END
ENDROUTINE
DELIMITER ;
