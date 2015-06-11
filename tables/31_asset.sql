CREATE TABLE asset
(
      id               ${ASSET_ID_TYPE}      NOT NULL AUTO_INCREMENT
    , title_article_id ${ARTICLE_ID_TYPE}    NOT NULL
    , type_id          ${ASSET_TYPE_ID_TYPE} NOT NULL
    , CONSTRAINT fk_asset_type_id_asset_type_id
        FOREIGN KEY (type_id) REFERENCES asset_type (id) 
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_asset_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_asset
        PRIMARY KEY (id)
)
;
