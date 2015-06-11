DELIMITER ENDROUTINE

CREATE PROCEDURE article_type_read
(
	  IN  arg_article_type_meta ${ARTICLE_TYPE_META_TYPE}
	, OUT arg_article_type_id   ${ARTICLE_TYPE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT article_type.id INTO arg_article_type_id
    FROM article_type 
    WHERE LOWER(article_type.meta) = LOWER(arg_article_type_meta)
    ;
    IF arg_article_type_id IS NULL THEN 
        CALL article_type_create (arg_article_type_meta, arg_article_type_id)
        ;
    END IF
    ;
END
ENDROUTINE
DELIMITER ;
