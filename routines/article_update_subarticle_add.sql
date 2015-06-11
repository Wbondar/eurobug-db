DELIMITER ENDROUTINE

CREATE PROCEDURE article_update_subarticle_add
(
	  IN arg_article_parent_id ${ARTICLE_ID_TYPE}
	, IN arg_article_child_id  ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    INSERT INTO subarticle (parent_id, child_id) VALUES
    (arg_article_parent_id, arg_article_child_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
