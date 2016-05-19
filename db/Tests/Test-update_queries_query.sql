USE RelativityDB;
SELECT * FROM Queries;
call update_queries_query(5,'test val 5 old');
call update_queries_query(10,'test val 10 old');
SELECT * FROM Queries;
call update_queries_query(5,'test val 5 new');
call update_queries_query(10,'test val 10 new');
SELECT * FROM Queries;