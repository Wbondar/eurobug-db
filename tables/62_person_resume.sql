CREATE TABLE person_resume
(
	  person_id ${PERSON_ID_TYPE} NOT NULL
	, resume_id ${ASSET_ID_TYPE}  NOT NULL
	, CONSTRAINT fk_person_resume_person_id
		FOREIGN KEY (person_id) REFERENCES person (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT fk_person_resume_resume_id
		FOREIGN KEY (resume_id) REFERENCES asset (id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	, CONSTRAINT pk_person_resume 
		PRIMARY KEY (person_id, resume_id)
)
;
