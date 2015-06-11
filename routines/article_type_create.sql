DELIMITER ENDROUTINE

CREATE PROCEDURE article_type_create_with_meta
(
      IN  arg_meta ${ARTICLE_TYPE_META_TYPE}
    , OUT arg_article_type_id    ${ARTICLE_TYPE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL nextval ('seq_article_type_id', @var_article_type_id)
    ;
    INSERT INTO article_type (id, meta) VALUES
    (@var_article_type_id, arg_meta)
    ;
    CALL setval ('seq_article_type_id', @var_article_type_id)
    ;
    SELECT @var_article_type_id INTO arg_article_type_id
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
