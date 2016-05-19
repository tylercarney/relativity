USE RelativityDB;
DROP PROCEDURE IF EXISTS update_queries_response;
DELIMITER $$
CREATE PROCEDURE `update_queries_response`(IN EntityID BIGINT(64),IN uResponse BLOB) BEGIN
	UPDATE Queries SET `Response`=uResponse WHERE Queries.EntityID=EntityID;
END$$