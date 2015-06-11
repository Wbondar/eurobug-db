CREATE VIEW view_form_legend AS
SELECT *
FROM view_form_element
WHERE element_type_meta = 'form_element_legend'
;
