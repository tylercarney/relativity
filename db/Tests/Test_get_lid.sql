USE RelativityDB;
SET @SomeID=0;
call get_lid(@SomeID);
SELECT @SomeID;