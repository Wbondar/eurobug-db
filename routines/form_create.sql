DELIMITER ENDROUTINE
CREATE PROCEDURE form_create
(
      IN  arg_form_meta ${ARTICLE_META_TYPE}
    , OUT arg_form_id   ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL article_create_with_meta ('form', CONCAT('form_', arg_form_meta), arg_form_id)
    ;
END
ENDROUTINE
DELIMITER ;
