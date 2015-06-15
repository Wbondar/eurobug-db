DELIMITER ENDROUTINE
CREATE PROCEDURE resume_update_position_add
(
      IN arg_resume_id   ${ASSET_ID_TYPE}
    , IN arg_position_id ${ASSET_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ; 
    INSERT INTO resume_position (resume_id, position_id) VALUES
    (arg_resume_id, arg_position_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
DELIMITER ENDROUTINE
CREATE PROCEDURE resume_update_education_add
(
      IN arg_resume_id                  ${ASSET_ID_TYPE}
    , IN arg_educational_institution_id ${PARTY_ID_TYPE}
    , IN arg_since                      ${DATETIME}
    , IN arg_until                      ${DATETIME}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ; 
    INSERT INTO resume_education (resume_id, educational_institution_id, since, until) VALUES
    (arg_resume_id, arg_educational_institution_id, arg_since, arg_until)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE resume_update_experience_add
(
      IN arg_resume_id   ${ASSET_ID_TYPE}
    , IN arg_party_id    ${PARTY_ID_TYPE}
    , IN arg_position_id ${ASSET_ID_TYPE}
    , IN arg_since       ${DATETIME}           
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ; 
    INSERT INTO resume_experience (resume_id, party_id, position_id, since) VALUES
    (arg_resume_id, arg_party_id, arg_position_id, arg_since)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
