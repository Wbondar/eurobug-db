DELIMITER ENDROUTINE
CREATE PROCEDURE nextval
(
      IN  "arg_sequence_title" ${SEQUENCE_TITLE_TYPE}
    , OUT arg_next_value     ${SEQUENCE_NEXT_VALUE_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    SET @var_sequence_title = "arg_sequence_title";
    SELECT sequence.id INTO @var_sequence_id 
    FROM sequence
    WHERE LOWER(sequence.title) = LOWER(@var_sequence_title)
    ;
    IF @var_sequence_id IS NULL THEN
        CALL sequence_create (@var_sequence_title, @var_sequence_id)
        ;
    END IF 
    ;
    IF @var_sequence_id IS NULL THEN
        LEAVE proc
        ;
    END IF
    ;
    SELECT sequence.next_value INTO arg_next_value 
    FROM sequence 
    WHERE sequence.id = @var_sequence_id
    ;
END
ENDROUTINE
DELIMITER ;
