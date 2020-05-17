DELIMITER $$
CREATE TRIGGER `insert_caseinfo_trigger` AFTER INSERT ON `cases`
 FOR EACH ROW BEGIN
    
    SET @trigger_action = 'Add';
    SET @follow_up = '';
    SET @case_id = NEW.id;
    SET @user_id = NEW.care_giver_id;
    SET @care_giver_id = (SELECT CONCAT(fname,' ', lname) from users where id = NEW.care_giver_id);
    SET @photos_ids = '';
    SET @status = '';
    SET @is_case_deleted = '';
    SET @updated_at  = UTC_TIMESTAMP();


    /****Start****/
    IF(NEW.follow_up != '' && NEW.follow_up IS NOT NULL) THEN
        
        SET @follow_up = CONCAT('<b> Diagnosis & Impression, Patient Instructions & Follow-Up Plan
: </b>', NEW.follow_up,', ');

    END IF;
    /**END***/

    /****Start****/

    IF(NEW.photos_ids != '' && NEW.photos_ids IS NOT NULL) THEN
        
        SET @photo_name = (SELECT img_name FROM case_photos WHERE id = NEW.photos_ids );

        SET @photos_ids = CONCAT('<b> Case Photos: </b>', @photo_name,', ');

    END IF;
    /**END***/

    /****Start****/
    IF(NEW.status != '' && NEW.status IS NOT NULL) THEN
        
        IF(NEW.status = 1) THEN 
            
            SET @status = CONCAT('Case Status added as <b>Active</b>, ');

        ELSEIF(NEW.status = 2) THEN
            
            SET @status = CONCAT('Case Status added as <b>Resolved</b>, ');

        ELSE
            
            SET @status = CONCAT('Case Status added as <b>Cancelled </b>, ');

        END IF;

    END IF;
    /**END***/
    

    /****Start****/

    IF(NEW.is_case_deleted != '' && NEW.is_case_deleted IS NOT NULL) THEN
        
        SET @is_case_deleted = NEW.is_case_deleted;
        
    END IF;
    /**END***/
    
    SET @log_message = concat("<b>", @care_giver_id, "</b> has added new case ");

    /*Insert into system log table*/

    INSERT INTO case_activity_log

        (`case_id`,`log_message`,`by_user_id`,`type`)

    VALUES

        (@case_id, @log_message, @user_id, @trigger_action);

END$$

DELIMITER ;