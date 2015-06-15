DELIMITER ENDROUTINE
CREATE PROCEDURE position_title_localization_create
(
	  IN arg_position_id       ${ASSET_ID_TYPE}
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
    SELECT asset.title_article_id INTO @var_position_title_article_id
    FROM asset  
    WHERE asset.id = arg_position_id    
    ;
    CALL article_localization_create_with_code (@var_position_title_article_id, arg_language_code, arg_message)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
