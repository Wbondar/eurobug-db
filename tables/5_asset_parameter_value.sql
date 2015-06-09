CREATE TABLE asset_parameter_value
(
      asset_id     ${ASSET_ID_TYPE}        NOT NULL
    , parameter_id ${PARAMETER_ID_TYPE}    NOT NULL
    , value        ${PARAMETER_VALUE_TYPE} NOT NULL
    , CONSTRAINT fk_asset_parameter_value_asset_id
        FOREIGN KEY (asset_id) REFERENCES asset (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_asset_parameter_value_parameter_id
        FOREIGN KEY (parameter_id) REFERENCES parameter (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_asset_parameter_value
        PRIMARY KEY (asset_id, parameter_id)
)
;
