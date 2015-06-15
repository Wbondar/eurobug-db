DELIMITER ENDROUTINE
CREATE PROCEDURE educational_institution_create
(
      IN  arg_party_meta    ${ARTICLE_META_TYPE}
    , OUT arg_party_id      ${PARTY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL party_create_with_meta ('educational_institution', arg_party_meta, arg_party_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
