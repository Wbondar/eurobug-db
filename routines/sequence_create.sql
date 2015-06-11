DELIMITER ENDROUTINE

CREATE PROCEDURE sequence_create
(
      IN  arg_sequence_title ${SEQUENCE_TITLE_TYPE}
    , OUT arg_sequence_id    ${SEQUENCE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    INSERT INTO sequence (title, next_value, current_value) VALUES
    (LOWER(arg_sequence_title), 1, 0)
    ;
END
ENDROUTINE
DELIMITER ;
