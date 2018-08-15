create or replace function loc_check_func() returns trigger as $$
declare
cnt int;
begin 
	select count(*) from location into cnt; 
	if cnt = 0
	then
		insert into location(name) values('Always Available');
	end if;
	return null;
end;
$$ language plpgsql;

create trigger loc_check
after delete on location
for each statement
execute procedure loc_check_func();