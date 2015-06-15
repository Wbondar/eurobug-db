DELIMITER ENDROUTINE
CREATE PROCEDURE account_create
(
	  IN  arg_account_name ${ARTICLE_META_TYPE}
	, IN  arg_account_password TEXT
	, OUT arg_account_id      ${PARTY_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    CALL party_type_read ('member', @var_party_type_id)
    ;
    CALL party_create (@var_party_type_id, arg_account_name, @var_party_id)
    ;
    SELECT id INTO arg_account_id
    FROM party 
    WHERE id = @var_party_id 
    ;
    INSERT INTO account (party_id, password_hash) VALUES
    (arg_account_id, arg_account_password)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
