CREATE TABLE measure_unit
(
      id               ${MEASURE_UNIT_ID_TYPE} NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}      NOT NULL
    , CONSTRAINT fk_measure_unit_title_article_id 
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_measure_unit
        PRIMARY KEY (id)
)
;
