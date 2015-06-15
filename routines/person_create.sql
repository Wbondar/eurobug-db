DELIMITER ENDROUTINE
CREATE PROCEDURE person_create
(   
      IN  arg_person_meta           ${ARTICLE_META_TYPE}
    , IN  arg_gender                   ${PERSON_SEX_TYPE}    
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
    CALL nextval ('seq_person_id', @var_person_id)
    ;
    CALL article_create_with_meta ('name_first', arg_person_meta, @var_name_first_article_id)
    ;
    CALL article_create_with_meta ('name_last', arg_person_meta, @var_name_last_article_id)
    ;
    INSERT INTO person (id, name_first_article_id, name_last_article_id, gender, nationality_id) VALUES
    (@var_person_id, @var_name_first_article_id, @var_name_last_article_id, arg_gender, arg_nationality_id)
    ;
    SELECT person.id INTO arg_person_id
    FROM person 
    WHERE person.id = @var_person_id
        AND person.name_first_article_id = @var_name_first_article_id
        AND person.name_last_article_id  = @var_name_last_article_id
        AND person.nationality_id        = arg_nationality_id
        AND UPPER(person.gender)         = UPPER(arg_gender) 
    ;
    CALL setval ('seq_person_id', arg_person_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
DELIMITER ENDROUTINE
CREATE PROCEDURE person_create_for_party
(   
      IN  arg_party_id           ${PARTY_ID_TYPE}
    , IN  arg_gender             ${PERSON_SEX_TYPE}    
    , IN  arg_nationality_id     ${NATIONALITY_ID_TYPE}
    , OUT arg_person_id          ${PERSON_ID_TYPE} 
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT article.meta INTO @var_party_meta 
    FROM party JOIN article ON party.title_article_id = article.id 
    WHERE party.id = arg_party_id
    ;
    CALL person_create (@var_party_meta, arg_gender, arg_nationality_id, arg_person_id)
    ;
    INSERT INTO party_person (party_id, person_id) VALUES
    (arg_party_id, arg_person_id)
    ;
END
ENDROUTINE
DELIMITER ;
