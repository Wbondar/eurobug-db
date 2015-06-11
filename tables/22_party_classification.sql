CREATE TABLE party_classification 
(
      party_category_id ${PARTY_CATEGORY_ID_TYPE} NOT NULL
    , party_id          ${PARTY_ID_TYPE}          NOT NULL
    , CONSTRAINT fk_party_classification_party_category_id
        FOREIGN KEY (party_category_id) REFERENCES party_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_party_classification_party_id
        FOREIGN KEY (party_id) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_party_classification_party_category_id
        PRIMARY KEY (party_category_id, party_id)
)
;
