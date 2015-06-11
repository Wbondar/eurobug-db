CREATE TABLE request_asset
(
      request_id ${REQUEST_ID_TYPE} NOT NULL
    , asset_id   ${ASSET_ID_TYPE}   NOT NULL
    , CONSTRAINT fk_request_asset_request_id
        FOREIGN KEY (request_id) REFERENCES request (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT fk_request_asset_asset_id
        FOREIGN KEY (asset_id) REFERENCES asset (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_request_asset
        PRIMARY KEY (request_id, asset_id)
)
;
    