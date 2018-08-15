create or replace function rating_update_func() returns trigger as $$
begin
	if (new.winnerscore is not null) and (new.loserscore is not null)
	then
		update player
		set rating = rating + 1
		where pid = new.winnerId;
		
		update player
		set rating = rating - 1
		where pid = new.loserId;
		
		update player
		set inactive = 1
		where pid = new.loserId and rating <= -5;
	end if;
	return null;
end; 	
$$ language plpgsql;

create trigger rating_update_trig
after insert on match
for each row
execute procedure rating_update_func();