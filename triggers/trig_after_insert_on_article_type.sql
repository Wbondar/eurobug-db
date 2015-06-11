DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_article_type AFTER INSERT ON article_type
FOR EACH ROW
BEGIN
    CALL setval ('seq_article_type_id', NEW.id)
    ;
END
ENDTRIGGER
DELIMITER ;

