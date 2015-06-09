CREATE TABLE measure_unit_conversion
(
      convert_from_id ${MEASURE_UNIT_ID_TYPE}    NOT NULL
    , convert_to_id   ${MEASURE_UNIT_ID_TYPE}    NOT NULL
    , coefficient     ${MEASURE_UNIT_VALUE_TYPE} NOT NULL
    , effective_date  ${DATETIME}                NOT NULL DEFAULT '1000-01-01'
    , CONSTRAINT fk_measure_unit_conversion_convert_from_id
        FOREIGN KEY (convert_from_id) REFERENCES measure_unit (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_measure_unit_conversion_convert_to_id
        FOREIGN KEY (convert_to_id) REFERENCES measure_unit (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_measure_unit_conversion
        PRIMARY KEY (convert_from_id, convert_to_id, effective_date)
)
;
