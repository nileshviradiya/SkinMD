DELIMITER $$
CREATE TRIGGER `insert_priscription_trigger` AFTER INSERT ON `prescriptions`
 FOR EACH ROW BEGIN
    
    SET @trigger_action = 'Add';
    SET @care_giver_id = (SELECT CONCAT(fname,' ', lname) from users where id = NEW.submitted_by);
    SET @medication = '';
    
    SET @log_message = concat("<b>", @care_giver_id, "</b> has added new case ");

    /*Insert into system log table*/

    INSERT INTO case_activity_log

        (`case_id`,`log_message`,`by_user_id`,`type`)

    VALUES

        (@case_id, @log_message, @user_id, @trigger_action);

END$$

DELIMITER ;