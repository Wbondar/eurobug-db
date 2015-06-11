DELIMITER ENDROUTINE
CREATE PROCEDURE article_localization_create
(
	  IN arg_article_id      ${ARTICLE_ID_TYPE}
	, IN arg_language_id     ${LANGUAGE_ID_TYPE}
	, IN arg_article_message ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    INSERT INTO article_localized (article_id, language_id, message) VALUES
    (arg_article_id, arg_language_id, arg_article_message)
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE article_localization_create_with_code
(
      IN arg_article_id      ${ARTICLE_ID_TYPE}
    , IN arg_language_code     ${LANGUAGE_CODE_TYPE}
    , IN arg_article_message ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT id INTO @var_language_id
    FROM language 
    WHERE language.code = arg_language_code
    ;
    CALL article_localization_create(arg_article_id, @var_language_id, arg_article_message)
    ;
END
ENDROUTINE
DELIMITER ;
