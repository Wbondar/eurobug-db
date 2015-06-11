CREATE TABLE person_email_address
(
      person_id        ${PERSON_ID_TYPE}        NOT NULL
    , email_address_id ${EMAIL_ID_TYPE} NOT NULL
    , CONSTRAINT fk_person_email_address_person_id
        FOREIGN KEY (person_id) REFERENCES person (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_person_email_address_email_address_id
        FOREIGN KEY (email_address_id) REFERENCES email_address (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_person_email_address
        PRIMARY KEY (person_id, email_address_id)
)
;
