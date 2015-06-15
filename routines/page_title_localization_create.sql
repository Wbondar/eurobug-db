DELIMITER ENDROUTINE
CREATE PROCEDURE page_title_localization_create
(
	  IN arg_page_id       ${ARTICLE_CATEGORY_ID_TYPE}
	, IN arg_language_code ${LANGUAGE_CODE_TYPE}
	, IN arg_message       ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    SELECT title_article_id INTO @var_page_title_article_id
    FROM article_category 
    WHERE article_category.id = arg_page_id 
    ;
    CALL article_localization_create_with_code (@var_page_title_article_id, arg_language_code, arg_message)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
