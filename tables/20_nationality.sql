CREATE TABLE nationality
(
      id               ${NATIONALITY_ID_TYPE} NOT NULL AUTO_INCREMENT
    , title_article_id ${ARTICLE_ID_TYPE}     NOT NULL
    , CONSTRAINT fk_nationality_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id) 
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_nationality
        PRIMARY KEY (id)
)
;
