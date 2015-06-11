CREATE VIEW view_email_address AS 
SELECT email_address.id AS id, CONCAT(email_address.local, '@', email_domain.value) AS email_address
FROM email_address JOIN email_domain ON email_address.domain_id = email_domain.id
;
