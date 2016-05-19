USE RelativityDB;
SELECT * FROM Queries;
call update_queries_response(5,'test val 5 old');
call update_queries_response(10,'test val 10 old');
SELECT * FROM Queries;
call update_queries_response(5,'test val 5 new');
call update_queries_response(10,'test val 10 new');
SELECT * FROM Queries;