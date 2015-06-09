CREATE TABLE phone_number
(
      id    ${PHONE_NUMBER_ID_TYPE}    NOT NULL
    , value ${PHONE_NUMBER_VALUE_TYPE} NOT NULL
    , CONSTRAINT pk_phone_number
        PRIMARY KEY (id)
)
;
