CREATE VIEW view_form_label AS
SELECT *
FROM view_form_element
WHERE LOWER(element_type_meta) = 'form_element_label'
;
