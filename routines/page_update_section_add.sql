DELIMITER ENDROUTINE
CREATE PROCEDURE page_update_section_add
(
      IN arg_page_superior_id ${ARTICLE_ID_TYPE}
    , IN arg_page_inferior_id ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL subarticle_create (arg_page_superior_id, arg_page_inferior_id)
    ;
END
ENDROUTINE
DELIMITER ;
