create or replace function reactivate() returns void as $$

begin
	update player
	set rating = rating + 2
	where inactive = 1;
	
	update player
	set inactive = 0
	where rating >= 0 and inactive = 1;
end;
$$ language plpgsql;
	