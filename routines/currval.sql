DELIMITER ENDROUTINE

CREATE PROCEDURE currval
(
      IN  arg_sequence_title ${SEQUENCE_TITLE_TYPE}
    , OUT arg_current_value  ${SEQUENCE_NEXT_VALUE_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT id INTO @var_sequence_id 
    FROM sequence
    WHERE LOWER(sequence.title) = LOWER(arg_sequence_title)
    ;
    IF @var_sequence_id IS NULL THEN
        CALL sequence_create (arg_sequence_title, @var_sequence_id)
        ;
    END IF 
    ;
    SELECT sequence.current_value INTO arg_current_value 
    FROM sequence 
    WHERE sequence.id = @var_sequence_id
    ;
END
ENDROUTINE
DELIMITER ;
