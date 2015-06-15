DELIMITER ENDROUTINE
CREATE PROCEDURE asset_create
(
      IN  arg_asset_type_id ${ASSET_TYPE_ID_TYPE}
    , IN  arg_article_id    ${ARTICLE_ID_TYPE}
    , OUT arg_asset_id      ${ASSET_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL nextval ('seq_asset_id', @var_asset_id)
    ;
    INSERT INTO asset (id, title_article_id, type_id) VALUES
    (@var_asset_id, arg_article_id, arg_asset_type_id)
    ;
    SELECT asset.id INTO arg_asset_id
    FROM asset 
    WHERE asset.id                 = @var_asset_id
        AND asset.title_article_id = arg_article_id
        AND asset.type_id          = arg_asset_type_id
    ;
    CALL setval ('seq_asset_id', arg_asset_id)
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE asset_create_with_meta
(
      IN  arg_asset_type_meta ${ARTICLE_META_TYPE}
    , IN  arg_asset_meta    ${ARTICLE_META_TYPE}
    , OUT arg_asset_id      ${ASSET_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL asset_type_read (arg_asset_type_meta, @var_asset_type_id)
    ;
    CALL article_create_with_meta ('title_asset', arg_asset_meta, @var_article_id)
    ;
    CALL asset_create (@var_asset_type_id, @var_article_id, arg_asset_id)
    ;
END
ENDROUTINE
DELIMITER ;
