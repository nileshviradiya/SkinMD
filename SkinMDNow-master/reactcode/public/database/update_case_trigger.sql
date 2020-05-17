DELIMITER $$
CREATE TRIGGER `update_caseinfo_trigger` AFTER UPDATE ON `cases`
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
    IF(NEW.follow_up != OLD.follow_up) THEN
        
        SET @follow_up = CONCAT('<b> Follow-Up Plan : </b>', NEW.follow_up, " (<b> Old Value: </b>", OLD.follow_up, '), ');
        
        SET @log_message = concat("<b>", @care_giver_id, "</b> has updated ", @follow_up);

        /*Insert into system log table*/

        INSERT INTO case_activity_log

            (`case_id`,`log_message`,`by_user_id`,`type`)

        VALUES

            (@case_id, @log_message, @user_id, @trigger_action);

    END IF;
    /**END***/
    

    /****Start****/
    IF(NEW.status != OLD.status) THEN
        
        IF(NEW.status = 2) THEN 
            
            SET @status = CONCAT('Case has been Resolved');
            
            /*Insert into system log table*/

            INSERT INTO case_activity_log

                (`case_id`,`log_message`,`by_user_id`,`type`)

            VALUES

                (@case_id, @status, @user_id, @trigger_action);
                
        ELSEIF(NEW.status = 3) THEN
            
            SET @status = CONCAT('Case has been <b>Cancelled </b>');
                        
            /*Insert into system log table*/
            INSERT INTO case_activity_log

                (`case_id`,`log_message`,`by_user_id`,`type`)

            VALUES

                (@case_id, @status, @user_id, @trigger_action);

        END IF;

    END IF;
    /**END***/
    

    /****Start****/

    IF(NEW.is_case_deleted != OLD.is_case_deleted) THEN
                
            SET @status = "Case has been <b>Deleted</b>";
            SET @trigger_action = 'Delete';

            /*Insert into system log table*/
            INSERT INTO case_activity_log

                (`case_id`,`log_message`,`by_user_id`,`type`)

            VALUES

                (@case_id, @status, @user_id, @trigger_action);
        
    END IF;
    /**END***/
    

END$$

DELIMITER ;