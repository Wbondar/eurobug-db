DELIMITER ENDROUTINE

CREATE PROCEDURE setval
(
	  IN arg_sequence_title ${SEQUENCE_TITLE_TYPE}
	, IN arg_current_value  ${SEQUENCE_CURRENT_VALUE_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    IF arg_current_value IS NOT NULL THEN 
        SELECT id INTO @var_sequence_id 
        FROM sequence
        WHERE LOWER(sequence.title) = LOWER(arg_sequence_title)
        ;
        IF @var_sequence_id IS NULL THEN
            CALL sequence_create (arg_sequence_title, @var_sequence_id)
            ;
        END IF 
        ;
        SELECT next_value INTO @var_next_id
        FROM sequence
        WHERE sequence.id = @var_sequence_id
        ;
        IF arg_current_value >= @var_next_id THEN
            UPDATE sequence
            SET next_value = arg_current_value + 1
            WHERE sequence.id = @var_sequence_id
            ;
        END IF
        ;
        UPDATE sequence
        SET current_value = arg_current_value
        WHERE sequence.id = @var_sequence_id
        ;
    END IF 
    ;
END
ENDROUTINE
DELIMITER ;
