DELIMITER ENDROUTINE
CREATE PROCEDURE position_create
(
      IN  arg_position_meta    ${ARTICLE_META_TYPE}
    , OUT arg_position_id      ${ASSET_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL asset_create_with_meta ('position', arg_position_meta, arg_position_id)
    ;
END
ENDROUTINE
DELIMITER ;
