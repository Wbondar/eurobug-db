CREATE TABLE resume_education
(
	  resume_id                  ${ASSET_ID_TYPE} NOT NULL
	, educational_institution_id ${PARTY_ID_TYPE} NOT NULL
	, since                      ${DATETIME}      NOT NULL
	, until                      ${DATETIME}      NOT NULL
	, CONSTRAINT fk_resume_education_resume_id
		FOREIGN KEY (resume_id) REFERENCES asset (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT fk_resume_education_educational_institution_id
		FOREIGN KEY (educational_institution_id) REFERENCES party (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT pk_resume_education 
		PRIMARY KEY (resume_id, educational_institution_id)
)
;
