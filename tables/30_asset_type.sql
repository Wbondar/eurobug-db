CREATE TABLE asset_type
(
      id               ${ASSET_TYPE_ID_TYPE} NOT NULL AUTO_INCREMENT
    , title_article_id ${ARTICLE_ID_TYPE}    NOT NULL
    , CONSTRAINT fk_asset_type_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_asset_type
        PRIMARY KEY (id)
)
;
