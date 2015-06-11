CREATE TABLE email_address
(
	  domain_id ${EMAIL_DOMAIN_ID_TYPE} NOT NULL
    , id        ${EMAIL_ID_TYPE}        NOT NULL AUTO_INCREMENT
    , local     ${EMAIL_LOCAL_VALUE_TYPE}     NOT NULL
    , CONSTRAINT fk_email_address_domain_id
        FOREIGN KEY (domain_id) REFERENCES email_domain (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_email_address 
        UNIQUE KEY (domain_id, local)
    , CONSTRAINT pk_email_address
        PRIMARY KEY (id)
)
;