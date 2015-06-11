DELIMITER ENDROUTINE

CREATE PROCEDURE party_type_read
(
	  IN  arg_party_type_meta ${ARTICLE_META_TYPE}
	, OUT arg_party_type_id   ${PARTY_TYPE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    SELECT party_type.id INTO @var_party_type_id
    FROM party_type JOIN article ON party_type.title_article_id = article.id
    WHERE LOWER(article.meta) = LOWER(arg_party_type_meta)
    ;
    IF @var_party_type_id IS NULL THEN 
        CALL party_type_create (arg_party_type_meta, @var_party_type_id)
        ;
    END IF 
    ;
    SELECT @var_party_type_id INTO arg_party_type_id
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
