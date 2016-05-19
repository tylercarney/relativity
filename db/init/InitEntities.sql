USE RelativityDB;
DELETE FROM `RelativityDB`.`Entities`;
INSERT INTO `RelativityDB`.`Entities` (`ID`, `Created`) VALUES ('1', NOW()); # whois
INSERT INTO `RelativityDB`.`Entities` (`ID`, `Created`) VALUES ('2', NOW()); # dig
INSERT INTO `RelativityDB`.`Entities` (`ID`, `Created`) VALUES ('3', NOW()); # traceroute
SELECT * FROM Entities;