DELIMITER ENDROUTINE

CREATE PROCEDURE article_type_create
(
      IN  arg_meta ${ARTICLE_TYPE_META_TYPE}
    , OUT arg_article_type_id    ${ARTICLE_TYPE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL nextval ('seq_article_type_id', @var_article_type_id)
    ;
    INSERT INTO article_type (id, meta) VALUES
    (@var_article_type_id, arg_meta)
    ;
    IF @var_article_type_id IS NOT NULL THEN
        SELECT article_type.id INTO arg_article_type_id
        FROM article_type
        WHERE article_type.id = @var_article_type_id
        ;
        CALL setval ('seq_article_type_id', @var_article_type_id)
        ;
    END IF 
    ;
END
ENDROUTINE
DELIMITER ;
