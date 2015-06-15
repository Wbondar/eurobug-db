DELIMITER ENDROUTINE
CREATE PROCEDURE nextval
(
      IN  arg_sequence_title ${SEQUENCE_TITLE_TYPE}
    , OUT arg_next_value     ${SEQUENCE_NEXT_VALUE_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    SELECT sequence.id INTO @var_sequence_id 
    FROM sequence
    WHERE LOWER(sequence.title) = LOWER(arg_sequence_title)
    ;
    IF @var_sequence_id IS NULL THEN
        CALL sequence_create (arg_sequence_title, @var_sequence_id)
        ;
    END IF 
    ;
    SELECT COALESCE(sequence.next_value, 1) INTO arg_next_value 
    FROM sequence 
    WHERE sequence.id = @var_sequence_id
    ;
END
ENDROUTINE
DELIMITER ;
