CREATE TABLE party_category_assignment
(
      party_category_id ${PARTY_CATEGORY_ID_TYPE}       NOT NULL
    , party_id          ${PARTY_ID_TYPE}                NOT NULL
    , id                ${PARTY_CATEGORY_ASSIGNMENT_ID_TYPE} NOT NULL
    , assigned_at       ${DATETIME}                     NOT NULL
    , unassigned_at     ${DATETIME}                         NULL
    , CONSTRAINT fk_party_category_party_assignment_party_category_id
        FOREIGN KEY (party_category_id) REFERENCES party_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_party_category_party_assignment_party_id
        FOREIGN KEY (party_id) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_party_category_party_assignment
        PRIMARY KEY (party_category_id, party_id, id)
)
;
