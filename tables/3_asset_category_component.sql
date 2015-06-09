CREATE TABLE asset_category_component
(
      parent_asset_category_id ${ASSET_CATEGORY_ID_TYPE} NOT NULL
    , child_asset_category_id  ${ASSET_CATEGORY_ID_TYPE} NOT NULL
    , CONSTRAINT fk_asset_category_component_parent_asset_category_id
        FOREIGN KEY (parent_asset_category_id) REFERENCES asset_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_asset_category_component_child_asset_category_id
        FOREIGN KEY (child_asset_category_id) REFERENCES asset_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_asset_category_component
        PRIMARY KEY (parent_asset_category_id, child_asset_category_id)
)
;
