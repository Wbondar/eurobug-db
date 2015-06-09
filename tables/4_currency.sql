CREATE TABLE currency 
(
      id   ${CURRENCY_ID_TYPE}   NOT NULL
    , code ${CURRENCY_CODE_TYPE} NOT NULL
    , CONSTRAINT fk_currency_id 
        FOREIGN KEY (id) REFERENCES measure_unit (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_currency_code
        UNIQUE KEY (code)
    , CONSTRAINT pk_currency 
        PRIMARY KEY (id)
)
;
