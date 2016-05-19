# Get some basic commands set up to run from PHP
USE RelativityDB;
DELETE FROM `RelativityDB`.`QueryTypes`;
INSERT INTO `RelativityDB`.`QueryTypes` (`EntityID`, `Name`,`exec`) VALUES (1,'whois','whois ' );
INSERT INTO `RelativityDB`.`QueryTypes` (`EntityID`, `Name`,`exec`) VALUES (2,'dig','dig ' );
INSERT INTO `RelativityDB`.`QueryTypes` (`EntityID`, `Name`,`exec`) VALUES (3,'traceroute','traceroute ' );
SELECT * FROM QueryTypes;