DELIMITER ENDROUTINE
CREATE PROCEDURE nationality_create
(
      IN  arg_nationality_title_article_id ${ARTICLE_ID_TYPE}
    , OUT arg_nationality_id               ${NATIONALITY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    CALL nextval ('seq_nationality_id', @var_nationality_id)
    ;
    INSERT INTO nationality (id, title_article_id) VALUES
    (@var_nationality_id, arg_nationality_title_article_id)
    ;
    SELECT id INTO arg_nationality_id
    FROM nationality 
    WHERE id = @var_nationality_id
        AND title_article_id = arg_nationality_title_article_id
    ;
    CALL setval ('seq_nationality_id', arg_nationality_id)
    ;
END
ENDROUTINE
DELIMITER ;

DELIMITER ENDROUTINE
CREATE PROCEDURE nationality_create_with_meta
(
      IN  arg_nationality_meta ${ARTICLE_META_TYPE}
    , OUT arg_nationality_id   ${NATIONALITY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
proc:BEGIN
    CALL article_create_with_meta ('title_nationality', arg_nationality_meta, @var_nationality_title_article_id)
    ;
    CALL nationality_create (@var_nationality_title_article_id, arg_nationality_id)
    ;
END
ENDROUTINE
DELIMITER ;
