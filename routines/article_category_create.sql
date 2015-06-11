DELIMITER ENDROUTINE
CREATE PROCEDURE article_category_create
(
      IN  arg_article_category_meta ${ARTICLE_META_TYPE}
    , OUT arg_article_category_id   ${ARTICLE_CATEGORY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    CALL article_create_with_meta ('title_article_category', arg_article_category_meta, @var_title_article_id)
    ;
    IF @var_title_article_id IS NULL THEN
        LEAVE proc 
        ;
    END IF 
    ;
    CALL nextval ('seq_article_category_id', @var_article_category_id)
    ;
    INSERT INTO article_category (id, title_article_id) VALUES
    (@var_article_category_id, @var_title_article_id)
    ;
    IF @var_article_category_id IS NOT NULL THEN
        CALL setval ('seq_article_category_id', @var_article_category_id)
        ;
        SELECT @var_article_category_id INTO arg_article_category_id
        ;
    END IF
    ;
END
ENDROUTINE
DELIMITER ;
