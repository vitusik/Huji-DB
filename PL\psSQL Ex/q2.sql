create or replace function active_check_func() returns trigger as $$
begin 
	if (select player.inactive from player where pid = new.winnerId) = 0 and (select player.inactive from player where pid = new.loserId) = 0
	then
		return new;
	else
		raise exception 'Inactive players may not play';
	end if;
end;
$$ language plpgsql;

create trigger active_check
before insert on match
for each row
execute procedure active_check_func();