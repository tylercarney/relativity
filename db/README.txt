Some scripts to get the initial DB set up.
Run in this order:

Assuming no existing db named RelativityDB (will let user config maybe?):
1) init\create_relativity_db.sql - Base Schema

Then set up some initial/default records:
2) init\InitEntities - Sets up a few EntityIDs with wich to create our inital Entities
3) init\InitQueryTypes - sets up a few commands: whois, dig, traceroute

Then set up some stored procedures :
4) StoreProcedures\get_lid.sql - defines get_lid helper function to determine last insert ID
5) StoreProcedures\new_query.sql - defines new_query(ID,Type) procedure that sets up Entity.ID fk for us
6) StoreProcedures\update_queries_query.sql todo - rename to UpdateQuery()?
7) StoreProcedures\update_queries_response.sql - thinking of splitting blobs off this anyway…
8) StoreProcedures\update_query_query.sql


