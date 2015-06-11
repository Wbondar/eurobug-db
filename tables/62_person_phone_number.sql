CREATE TABLE person_phone_number
(
      person_id       ${PERSON_ID_TYPE}       NOT NULL
    , phone_number_id ${PHONE_NUMBER_ID_TYPE} NOT NULL
    , CONSTRAINT fk_person_phone_number_person_id
        FOREIGN KEY (person_id) REFERENCES person (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_person_phone_number_phone_number_id
        FOREIGN KEY (phone_number_id) REFERENCES phone_number (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_person_phone_number
        PRIMARY KEY (person_id, phone_number_id)
)
;
