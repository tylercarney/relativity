USE RelativityDB;
DROP PROCEDURE IF EXISTS new_query;
DELIMITER $$
CREATE PROCEDURE `new_query` (OUT QueryID BIGINT(64),IN QueryType BIGINT(64)) BEGIN
#Prime our EntityID
#SELECT QueryID;
#SELECT QueryType;
	INSERT INTO `Entities`()VALUES();
    SET @LID=0;
    call get_lid(@LID);
#Create the Query Record
    INSERT INTO `Queries` (`EntityID`,`Type`) VALUES (@LID,QueryType);
    call get_lid(QueryID);
    # Back in PHP land we'll take this ID and use it to update_query(EntityID,exec);
    # exec will be built up from the QueryType.exec value + (likely evil) user input
    # No really, it can't be trusted. Even "just on my computer". Live with it.
END$$