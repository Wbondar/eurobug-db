DELIMITER ENDROUTINE

CREATE PROCEDURE asset_type_create
(
      IN  arg_title_article_id ${ARTICLE_ID_TYPE}
    , OUT arg_asset_type_id    ${ASSET_TYPE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL nextval ('seq_asset_type_id', @var_asset_type_id)
    ;
    INSERT INTO asset_type (id, title_article_id) VALUES
    (@var_asset_type_id, arg_title_article_id)
    ;
    CALL setval ('seq_asset_type_id', @var_asset_type_id)
    ;
    SELECT @var_asset_type_id INTO arg_asset_type_id
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE

CREATE PROCEDURE asset_type_create_with_meta
(
      IN  meta              ${ARTICLE_META_TYPE}
    , OUT arg_asset_type_id ${ASSET_TYPE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL nextval ('seq_title_asset_type_id', @var_title_asset_type_id)
    ;
    CALL article_create_with_meta ('title_asset_type', CONCAT('title_asset_type', @var_title_asset_type_id), @var_title_article_id)
    ;
    CALL asset_type_create (@var_title_article_id, arg_asset_type_id)
    ;
    CALL setval ('seq_title_asset_type_id', @var_title_asset_type_id)
    ;
END
ENDROUTINE
DELIMITER ;
