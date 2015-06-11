DELIMITER ENDROUTINE

CREATE PROCEDURE party_create
(
	  IN  arg_article_id    ${ARTICLE_ID_TYPE}
	, IN  arg_party_type_id ${PARTY_TYPE_ID_TYPE}
	, OUT arg_party_id      ${PARTY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL nextval ('seq_party_id', @var_party_id);
    INSERT INTO party (id, type_id, title_article_id) VALUES
    (@var_party_id, arg_party_type_id, arg_article_id)
    ;
    CALL setval ('seq_party_id', @var_party_id);
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
