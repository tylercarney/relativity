USE RelativityDB;
SET @NewQ=0; # just init... this shouldn't really be used... evar
SET @QType=1; # whois by default iirc, don't hold me to it yet - we're just getting bootstraped in more ways than one
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
call new_query(@NewQ,@QType); #  @NewQ will have the new Query's EntityID #
SELECT @NewQ;
SELECT * FROM Entities; #Should only be one more
SELECT * FROM Queries; #That matches our new query
SELECT * FROM QueryTypes; #Should stay the same and include the @QType above