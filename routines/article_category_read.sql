DELIMITER ENDROUTINE

CREATE PROCEDURE article_category_read
(
	  IN  arg_article_category_meta ${ARTICLE_META_TYPE}
	, OUT arg_article_category_id   ${ARTICLE_CATEGORY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
READS SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT article_category.id INTO @var_article_category_id
    FROM article_category 
        JOIN article ON article_category.title_article_id = article.id 
    WHERE LOWER(article.meta) = LOWER(arg_article_category_meta)
    ;
    IF @var_article_category_id IS NULL THEN
        CALL article_category_create (arg_article_category_meta, @var_article_category_id)
        ;
    END IF 
    ;
    IF @var_article_category_id IS NOT NULL THEN
        SELECT @var_article_category_id INTO arg_article_category_id
        ;
    END IF
    ;
END
ENDROUTINE
DELIMITER ;
