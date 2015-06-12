DELIMITER ENDROUTINE
CREATE PROCEDURE page_create
(
      IN  arg_page_meta ${ARTICLE_META_TYPE}
    , OUT arg_page_id   ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL article_create_with_meta ('page', arg_page_meta, arg_page_id);
END
ENDROUTINE
DELIMITER ;
