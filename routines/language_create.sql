DELIMITER ENDROUTINE
CREATE PROCEDURE language_create
(
	  IN  arg_language_code ${LANGUAGE_CODE_TYPE}
    , IN arg_placeholder ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
	, OUT arg_language_id   ${LANGUAGE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL article_create_with_meta ('title_language', arg_language_code, @var_title_article_id)
    ;
    CALL nextval ('seq_language_id', @var_language_id)
    ;
    INSERT INTO language (id, code, title_article_id, placeholder) VALUES
    (@var_language_id, arg_language_code, @var_title_article_id, arg_placeholder)
    ;
    SELECT id INTO arg_language_id
    FROM language 
    WHERE id = @var_language_id AND code = arg_language_code
    ;
    CALL setval ('seq_language_id', arg_language_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
