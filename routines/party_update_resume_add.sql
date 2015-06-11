DELIMITER ENDROUTINE

CREATE PROCEDURE party_update_add_resume
(
      IN arg_party_id  ${PARTY_ID_TYPE}
    , IN arg_asset_id ${ASSET_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    INSERT INTO party_resume (party_id, asset_id) VALUES
    (arg_party_id, arg_asset_id)
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
