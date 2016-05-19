USE RelativityDB;
DROP PROCEDURE IF EXISTS update_queries_query;
DELIMITER $$
CREATE PROCEDURE `update_queries_query`(IN EntityID BIGINT(64),IN uQuery BLOB) BEGIN
	UPDATE Queries SET `Query`=uQuery WHERE Queries.EntityID=EntityID;
END$$