DELIMITER ENDROUTINE

CREATE PROCEDURE party_update_person_add
(
	  IN arg_party_id  ${PARTY_ID_TYPE}
	, IN arg_person_id ${PERSON_ID_TYPE} 
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    INSERT INTO party_staff (party_id, person_id) VALUES
    (arg_party_id, arg_person_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
