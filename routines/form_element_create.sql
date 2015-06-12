DELIMITER ENDROUTINE
CREATE PROCEDURE form_element_create
(
      IN  arg_form_meta         ${ARTICLE_META_TYPE}
    , IN  arg_element_type_meta ${ARTICLE_TYPE_META_TYPE}
    , IN  arg_element_meta      ${ARTICLE_META_TYPE}
    , OUT arg_element_id        ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    SET @var_element_type_meta = CONCAT('form_element_', arg_element_type_meta)
    ;
    CALL article_type_read (@var_element_type_meta, @var_element_type_id)
    ;
    CALL article_create (@var_element_type_id, arg_element_meta, arg_element_id)
    ;
    CALL form_read (arg_form_meta, @var_form_id)
    ;
    CALL subarticle_create (@var_form_id, arg_element_id)
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE form_label_create
(
      IN  arg_form_meta   ${ARTICLE_META_TYPE}
    , IN  arg_label_meta ${ARTICLE_META_TYPE}
    , OUT arg_label_id   ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL form_element_create (arg_form_meta, 'label', arg_label_meta, arg_label_id);
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE form_legend_create
(
      IN  arg_form_meta   ${ARTICLE_META_TYPE}
    , IN  arg_legend_meta ${ARTICLE_META_TYPE}
    , OUT arg_legend_id   ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL form_element_create (arg_form_meta, 'legend', arg_legend_meta, arg_legend_id);
END
ENDROUTINE
DELIMITER ;


DELIMITER ENDROUTINE
CREATE PROCEDURE form_button_create
(
      IN  arg_form_meta   ${ARTICLE_META_TYPE}
    , IN  arg_button_meta ${ARTICLE_META_TYPE}
    , OUT arg_button_id   ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL form_element_create (arg_form_meta, 'button', arg_button_meta, arg_button_id);
END
ENDROUTINE
DELIMITER ;

