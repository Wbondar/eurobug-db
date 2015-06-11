CREATE TABLE measure_unit_conversion
(
      source      ${MEASURE_UNIT_ID_TYPE}    NOT NULL
    , target      ${MEASURE_UNIT_ID_TYPE}    NOT NULL
    , coefficient ${MEASURE_UNIT_VALUE_TYPE} NOT NULL
    , CONSTRAINT fk_measure_unit_conversion_source
        FOREIGN KEY (source) REFERENCES measure_unit (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT fk_measure_unit_conversion_target
        FOREIGN KEY (source) REFERENCES measure_unit (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT pk_measure_unit
        PRIMARY KEY (source, target)
)
;

