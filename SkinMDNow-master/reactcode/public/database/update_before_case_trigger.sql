DELIMITER $$
CREATE TRIGGER `update_before_caseinfo_trigger` BEFORE UPDATE ON `cases`
 FOR EACH ROW BEGIN
    
    SET @trigger_action = 'Update';
    SET @follow_up = '';
    SET @case_id = NEW.id;
    SET @user_id = NEW.submitted_by;
    SET @care_giver_id = (SELECT CONCAT(fname,' ', lname) from users where id = NEW.submitted_by);
    SET @photos_ids = '';
    SET @status = '';
    SET @is_case_deleted = '';
    SET @updated_at  = UTC_TIMESTAMP();

    /****Start****/

    IF(NEW.photos_ids != OLD.photos_ids) THEN        

        SET @photo_old = (SELECT img_name as img1 FROM case_photos WHERE id = OLD.photos_ids );
        SET @photo_new = (SELECT img_name as img2 FROM case_photos WHERE id = NEW.photos_ids );

        SET @photos_ids = CONCAT(' Case Photos:  ',"(OLD Values: ", @photo_old, ")  and  (New Values: ", @photo_new,")" );
       
        SET @log_message = concat( @care_giver_id, " has updated ", @photos_ids);

        /*Insert into system log table*/

        INSERT INTO case_activity_log

            (`case_id`,`log_message`,`by_user_id`,`type`)

        VALUES

            (@case_id, @log_message, @user_id, @trigger_action);
        


    END IF;
    /**END***/


    
END$$

DELIMITER ;