CREATE TABLE asset_classification 
(
      asset_category_id ${ASSET_CATEGORY_ID_TYPE} NOT NULL
    , asset_id          ${ASSET_ID_TYPE}          NOT NULL
    , CONSTRAINT fk_asset_classification_asset_category_id
        FOREIGN KEY (asset_category_id) REFERENCES asset_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_asset_classification_asset_id
        FOREIGN KEY (asset_id) REFERENCES asset (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_asset_classification_asset_category_id
        PRIMARY KEY (asset_category_id, asset_id)
)
;
