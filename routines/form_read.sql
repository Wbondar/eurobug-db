DELIMITER ENDROUTINE
CREATE PROCEDURE form_read
(
      IN  arg_form_meta ${ARTICLE_META_TYPE}
    , OUT arg_form_id   ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT form.id INTO arg_form_id
    FROM article AS form 
        JOIN article_type AS form_type ON form.type_id = form_type.id 
    WHERE LOWER(form.meta) = LOWER(CONCAT('form_', arg_form_meta))
        AND LOWER(form_type.meta) = 'form'
    ;
END
ENDROUTINE
DELIMITER ;
