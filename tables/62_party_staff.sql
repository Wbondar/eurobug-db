CREATE TABLE party_staff
(
      party_id  ${PARTY_ID_TYPE}  NOT NULL
    , person_id ${PERSON_ID_TYPE} NOT NULL
    , CONSTRAINT fk_party_staff_party_id
        FOREIGN KEY (party_id) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_party_staff_person_id
        FOREIGN KEY (person_id) REFERENCES person (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_party_staff_party_id
        PRIMARY KEY (party_id, person_id)
)
;
