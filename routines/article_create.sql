DELIMITER ENDROUTINE
CREATE PROCEDURE article_create
(
      IN  arg_article_type_id ${ARTICLE_TYPE_ID_TYPE}
    , IN  arg_article_meta    ${ARTICLE_META_TYPE}
    , OUT arg_article_id      ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL nextval ('seq_article_id', @var_article_id);
    INSERT INTO article (id, type_id, meta) VALUES
    (@var_article_id, arg_article_type_id, arg_article_meta)
    ;
    CALL setval ('seq_article_id', @var_article_id);
    SELECT @var_article_id INTO arg_article_id
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE article_create_with_meta
(
      IN  arg_article_type_meta ${ARTICLE_TYPE_META_TYPE}
    , IN  arg_article_meta    ${ARTICLE_META_TYPE}
    , OUT arg_article_id      ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL article_type_read (arg_article_type_meta, @var_article_type_id)
    ;
    CALL article_create (@var_article_type_id, arg_article_meta, arg_article_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
