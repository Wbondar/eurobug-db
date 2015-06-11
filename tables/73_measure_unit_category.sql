CREATE TABLE measure_unit_category
(
      id               ${MEASURE_UNIT_CATEGORY_ID_TYPE} NOT NULL AUTO_INCREMENT
    , title_article_id ${MEASURE_UNIT_ID_TYPE}          NOT NULL
    , CONSTRAINT fk_measure_unit_category_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES measure_unit (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_measure_unit_category
        PRIMARY KEY (id)
)
;
