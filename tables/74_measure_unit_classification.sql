CREATE TABLE measure_unit_classification 
(
      measure_unit_category_id ${MEASURE_UNIT_CATEGORY_ID_TYPE} NOT NULL
    , measure_unit_id          ${MEASURE_UNIT_ID_TYPE}          NOT NULL
    , CONSTRAINT fk_measure_unit_classification_measure_unit_category_id
        FOREIGN KEY (measure_unit_category_id) REFERENCES measure_unit_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_measure_unit_classification_measure_unit_id
        FOREIGN KEY (measure_unit_id) REFERENCES measure_unit (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_measure_unit_classification_measure_unit_category_id
        PRIMARY KEY (measure_unit_category_id, measure_unit_id)
)
;
