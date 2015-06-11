CREATE TABLE party_email_address
(
      party_id         ${PARTY_ID_TYPE}         NOT NULL
    , email_address_id ${EMAIL_ID_TYPE} NOT NULL
    , CONSTRAINT fk_party_email_address_party_id
        FOREIGN KEY (party_id) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_party_email_address_email_address_id
        FOREIGN KEY (email_address_id) REFERENCES email_address (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_party_email_address
        PRIMARY KEY (party_id, email_address_id)
)
;
