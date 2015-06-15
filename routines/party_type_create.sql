DELIMITER ENDROUTINE

CREATE PROCEDURE party_type_create
(
      IN  arg_party_type_meta ${ARTICLE_META_TYPE}
    , OUT arg_party_type_id    ${PARTY_TYPE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL nextval ('seq_party_type_id', @var_party_type_id)
    ;
    CALL article_create_with_meta ('title_party_type', arg_party_type_meta, @var_party_type_title_article_id)
    ;
    INSERT INTO party_type (id, title_article_id) VALUES
    (@var_party_type_id, @var_party_type_title_article_id)
    ;
    CALL setval ('seq_party_type_id', @var_party_type_id)
    ;
    SELECT @var_party_type_id INTO arg_party_type_id
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
