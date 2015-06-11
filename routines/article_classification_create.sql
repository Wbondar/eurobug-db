DELIMITER ENDROUTINE
CREATE PROCEDURE article_classification_create
(
      IN  arg_article_category_id ${ARTICLE_CATEGORY_ID_TYPE}
    , IN  arg_article_id          ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    INSERT INTO article_classification (article_id, article_category_id) VALUES
    (arg_article_id, arg_article_category_id)
    ;
END
ENDROUTINE
DELIMITER ;
DELIMITER ENDROUTINE

CREATE PROCEDURE article_classification_create_with_meta
(
      IN  arg_article_category_meta ${ARTICLE_META_TYPE}
    , IN  arg_article_id            ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
article_classification_create_with_meta:BEGIN
    CALL article_category_read (arg_article_category_meta, @var_article_category_id)
    ;
    IF @var_article_category_id IS NULL THEN
        LEAVE article_classification_create_with_meta
        ;
    END IF
    ;
    CALL article_classification_create (@var_article_category_id, arg_article_id)
    ;
END
ENDROUTINE
DELIMITER ;
