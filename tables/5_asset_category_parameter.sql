CREATE TABLE asset_category_parameter
(
      asset_category_id ${ASSET_CATEGORY_ID_TYPE} NOT NULL
    , parameter_id      ${PARAMETER_ID_TYPE}      NOT NULL
    , CONSTRAINT fk_asset_category_parameter_asset_category_id
        FOREIGN KEY (asset_category_id) REFERENCES asset_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_asset_category_parameter_parameter_id
        FOREIGN KEY (parameter_id) REFERENCES parameter (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_asset_category_parameter
        PRIMARY KEY (asset_category_id, parameter_id)
)
;
