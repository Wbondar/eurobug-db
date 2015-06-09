CREATE TABLE parameter
(
      id               ${PARAMETER_ID_TYPE}       NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}         NOT NULL
    , measure_unit_id  ${MEASURE_UNIT_ID_TYPE}    NOT NULL
    , value_default    ${MEASURE_UNIT_VALUE_TYPE} NOT NULL DEFAULT 0
    , CONSTRAINT fk_parameter_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_parameter_measure_unit_id
        FOREIGN KEY (measure_unit_id) REFERENCES measure_unit (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_parameter 
        PRIMARY KEY (id)
)
;
