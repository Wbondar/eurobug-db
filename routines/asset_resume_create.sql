DELIMITER ENDROUTINE

CREATE PROCEDURE asset_resume_create
(
      IN  arg_article_id ${ARTICLE_ID_TYPE}
    , OUT arg_asset_id   ${ASSET_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ; 
    CALL article_type_read ('resume', @var_article_type_resume_id)
    ;
    SELECT article.id INTO @var_article_id
    FROM article 
    WHERE article.type_id = @var_article_type_resume_id
        AND article.id = arg_article_id
    ;
    CALL asset_type_read ('resume', @var_asset_type_resume_id);
    CALL asset_create (@var_asset_type_resume_id, @var_article_id, arg_asset_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
