CREATE TABLE sequence
(
      id            ${SEQUENCE_ID_TYPE}            NOT NULL
    , next_value    ${SEQUENCE_NEXT_VALUE_TYPE}    NOT NULL DEFAULT 1
    , current_value ${SEQUENCE_CURRENT_VALUE_TYPE} NOT NULL DEFAULT 0
    , title         ${SEQUENCE_TITLE_TYPE}         NOT NULL
    , CONSTRAINT uk_sequence_title
        UNIQUE KEY (title)
    , CONSTRAINT pk_sequence
        PRIMARY KEY (id)
)
;
