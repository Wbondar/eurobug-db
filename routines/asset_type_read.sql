DELIMITER ENDROUTINE

CREATE PROCEDURE asset_type_read
(
	  IN  arg_asset_type_meta ${ARTICLE_META_TYPE}
	, OUT arg_asset_type_id   ${ASSET_TYPE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    SELECT asset_type.id INTO @var_asset_type_id
    FROM asset_type JOIN article ON asset_type.title_article_id = article.id
    WHERE LOWER(article.meta) = LOWER(arg_asset_type_meta)
    ;
    IF @var_asset_type_id IS NULL THEN
        CALL asset_type_create (arg_asset_type_meta, @var_asset_type_id)
        ;
    END IF 
    ;
    SELECT @var_asset_type_id INTO arg_asset_type_id
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
