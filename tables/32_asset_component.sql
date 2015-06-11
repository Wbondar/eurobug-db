CREATE TABLE asset_component
(
      parent_id ${ASSET_ID_TYPE} NOT NULL
    , child_id  ${ASSET_ID_TYPE} NOT NULL
    , CONSTRAINT fk_asset_component_parent_id
        FOREIGN KEY (parent_id) REFERENCES asset (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_asset_component_child_id
        FOREIGN KEY (child_id) REFERENCES asset (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_asset_component
        PRIMARY KEY (parent_id, child_id)
)
;
