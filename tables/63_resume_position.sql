CREATE TABLE resume_position
(
	  resume_id   ${ASSET_ID_TYPE} NOT NULL
	, position_id ${ASSET_ID_TYPE} NOT NULL
	, CONSTRAINT fk_resume_position_resume_id
		FOREIGN KEY (resume_id) REFERENCES asset (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT fk_resume_position_position_id
		FOREIGN KEY (position_id) REFERENCES asset (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT pk_resume_position 
		PRIMARY KEY (resume_id, position_id)
)
;
