DELIMITER ENDROUTINE
CREATE PROCEDURE party_create
(
      IN  arg_party_type_id ${PARTY_TYPE_ID_TYPE}
    , IN  arg_party_meta    ${ARTICLE_META_TYPE}
    , OUT arg_party_id      ${PARTY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL article_create_with_meta ('title_party', arg_party_meta, @var_party_title_id)
    ;
    CALL nextval ('seq_party_id', @var_party_id)
    ;
    INSERT INTO party (id, type_id, title_article_id) VALUES
    (@var_party_id, arg_party_type_id, @var_party_title_id)
    ;
    SELECT party.id INTO arg_party_id 
    FROM party 
    WHERE party.id = @var_party_id
        AND party.type_id = arg_party_type_id
        AND party.title_article_id = @var_party_title_id
    ;
    CALL setval ('seq_party_id', arg_party_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE party_create_with_meta
(
      IN  arg_party_type_meta ${ARTICLE_META_TYPE}
    , IN  arg_party_meta    ${ARTICLE_META_TYPE}
    , OUT arg_party_id      ${PARTY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL party_type_read (arg_party_type_meta, @var_party_type_id)
    ;
    CALL party_create (@var_party_type_id, arg_party_meta, arg_party_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
