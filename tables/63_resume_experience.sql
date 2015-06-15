CREATE TABLE resume_experience
(
	  resume_id   ${ASSET_ID_TYPE} NOT NULL
	, party_id    ${PARTY_ID_TYPE} NOT NULL
	, position_id ${ASSET_ID_TYPE} NOT NULL
	, since       ${DATETIME}      NOT NULL
	, until       ${DATETIME}          NULL
	, CONSTRAINT fk_resume_experience_resume_id
		FOREIGN KEY (resume_id) REFERENCES asset (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT fk_resume_experience_party_id
		FOREIGN KEY (party_id) REFERENCES party (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT fk_resume_experience_position_id
		FOREIGN KEY (position_id) REFERENCES asset (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT pk_resume_experience 
		PRIMARY KEY (resume_id, party_id, position_id)
)
;
