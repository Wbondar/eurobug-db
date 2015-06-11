CREATE TABLE person_language
(
      person_id   ${PERSON_ID_TYPE}   NOT NULL
    , language_id ${LANGUAGE_ID_TYPE} NOT NULL
    , CONSTRAINT fk_person_language_person_id
        FOREIGN KEY (person_id) REFERENCES person (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT fk_person_language_language_id
        FOREIGN KEY (language_id) REFERENCES language (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_person_language
        PRIMARY KEY (person_id, language_id)
)
;
    