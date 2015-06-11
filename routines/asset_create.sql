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
    START TRANSACTION
    ; 
    CALL nextval ('seq_asset_id', @var_asset_id);
    INSERT INTO asset (id, title_article_id, type_id) VALUES
    (@var_asset_id, arg_article_id, arg_asset_type_id)
    ;
    CALL setval ('seq_asset_id', @var_asset_id);
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
