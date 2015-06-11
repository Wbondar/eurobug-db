DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_article AFTER INSERT ON article
FOR EACH ROW
BEGIN
    CALL setval ('seq_article_id', NEW.id)
    ;
END
ENDTRIGGER
DELIMITER ;

