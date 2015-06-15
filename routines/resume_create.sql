DELIMITER ENDROUTINE
CREATE PROCEDURE resume_create
(
      IN  arg_person_id  ${PERSON_ID_TYPE}
    , OUT arg_resume_id  ${ASSET_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ; 
    CALL nextval ('seq_asset_id', @var_resume_id)
    ;
    CALL asset_create_with_meta ('resume', CONCAT('resume', @var_resume_id), arg_resume_id)
    ;
    INSERT INTO person_resume (person_id, resume_id) VALUES
    (arg_person_id, arg_resume_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
