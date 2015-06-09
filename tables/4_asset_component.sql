CREATE TABLE asset_component
(
      parent_asset_id ${ASSET_ID_TYPE} NOT NULL
    , child_asset_id  ${ASSET_ID_TYPE} NOT NULL
    , CONSTRAINT fk_asset_component_parent_asset_id
        FOREIGN KEY (parent_asset_id) REFERENCES asset (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_asset_component_child_asset_id
        FOREIGN KEY (child_asset_id) REFERENCES asset (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_asset_component
        PRIMARY KEY (parent_asset_id, child_asset_id)
)
;
