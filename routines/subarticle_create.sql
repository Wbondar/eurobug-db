DELIMITER ENDROUTINE
CREATE PROCEDURE subarticle_create
(
      IN arg_article_superior_id ${ARTICLE_ID_TYPE}
    , IN arg_article_inferior_id ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    INSERT INTO subarticle (parent_id, child_id) VALUES
    (arg_article_superior_id, arg_article_inferior_id)
    ;
END
ENDROUTINE
DELIMITER ;
