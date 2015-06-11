CREATE TABLE request
(
      id      ${REQUEST_ID_TYPE} NOT NULL AUTO_INCREMENT
    , who     ${PARTY_ID_TYPE}   NOT NULL
    , to_whom ${PARTY_ID_TYPE}   NOT NULL
    , requested_at    ${DATETIME}        NOT NULL
    , CONSTRAINT pk_request
        PRIMARY KEY (id, who, to_whom)
)
;
