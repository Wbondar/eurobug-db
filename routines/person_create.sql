DELIMITER ENDROUTINE

CREATE PROCEDURE person_create
(
      IN  arg_name_first_article_id ${ARTICLE_ID_TYPE}    
    , IN  arg_name_last_article_id  ${ARTICLE_ID_TYPE}    
    , IN  arg_sex                   ${PERSON_SEX_TYPE}    
    , IN  arg_nationality_id        ${NATIONALITY_ID_TYPE}
    , OUT arg_person_id             ${PERSON_ID_TYPE} 
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL nextval ('seq_person_id', @var_person_id);
    INSERT INTO person (id, name_last_article_id, name_last_article_id, sex, nationality_id) VALUES
    (@var_person_id, arg_name_first_article_id, arg_name_last_article_id, arg_sex, arg_nationality_id)
    ;
    CALL setval ('seq_person_id', @var_person_id);
    SELECT @var_person_id INTO arg_person_id
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
