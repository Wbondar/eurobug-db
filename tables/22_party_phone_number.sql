CREATE TABLE party_phone_number
(
      party_id        ${PARTY_ID_TYPE}        NOT NULL
    , phone_number_id ${PHONE_NUMBER_ID_TYPE} NOT NULL
    , CONSTRAINT fk_party_phone_number_party_id
        FOREIGN KEY (party_id) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_party_phone_number_phone_number_id
        FOREIGN KEY (phone_number_id) REFERENCES phone_number (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_party_phone_number
        PRIMARY KEY (party_id, phone_number_id)
)
;
