CREATE TABLE account 
(
      party_id      ${PARTY_ID_TYPE}
    , password_hash TEXT
    , CONSTRAINT fk_account_party_id
        FOREIGN KEY (party_id) REFERENCES party (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT pk_account
        PRIMARY KEY (party_id)
)
;
