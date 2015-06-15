DELIMITER ENDROUTINE
CREATE PROCEDURE page_read
(
      IN  arg_page_meta ${ARTICLE_META_TYPE}
    , OUT arg_page_id   ${ARTICLE_CATEGORY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
READS SQL DATA
SQL SECURITY DEFINER
BEGIN
    CALL article_category_read (CONCAT('page_', arg_page_meta), arg_page_id);
END
ENDROUTINE
DELIMITER ;