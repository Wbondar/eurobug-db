CREATE TABLE article
(
      id        ${ARTICLE_ID_TYPE}      NOT NULL
    , meta      ${ARTICLE_META_TYPE}    NOT NULL
    , type_id   ${ARTICLE_TYPE_ID_TYPE} NOT NULL
    /*, parent_id ${ARTICLE_ID_TYPE}          NULL DEFAULT NULL*/
    , CONSTRAINT uk_article_type_id_meta
        UNIQUE KEY (type_id, meta)
    , CONSTRAINT fk_article_type_id
        FOREIGN KEY (type_id) REFERENCES article_type (id) 
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    /*, CONSTRAINT fk_article_parent_id
        FOREIGN KEY (parent_id) REFERENCES article (id) 
            ON DELETE RESTRICT
            ON UPDATE RESTRICT*/
    , CONSTRAINT pk_article
        PRIMARY KEY (id)
)
;
