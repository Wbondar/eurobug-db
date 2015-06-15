DELIMITER ENDROUTINE
CREATE PROCEDURE page_update_article_add
(
      IN arg_page_id    ${ARTICLE_CATEGORY_ID_TYPE}
    , IN arg_article_id ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL article_classification_create (arg_page_id, arg_article_id)
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE page_update_article_add_with_meta
(
      IN arg_page_meta    ${ARTICLE_META_TYPE}
    , IN arg_article_id ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
	CALL page_read (arg_page_meta, @var_page_id)
	;
    CALL page_update_article_add (@var_page_id, arg_article_id)
    ;
END
ENDROUTINE
DELIMITER ;
