create or replace function top_check_func() returns trigger as $$
declare
i record;
maxr integer;
begin 
	select max(rating) into maxr from player;
	delete from top;
	for i in select pid  from player where rating = maxr order by pid loop
		insert into top values(i.pid);
	end loop;
	return null;
end;
$$ language plpgsql;

create trigger top_check
after insert or update or delete on player
for each statement
execute procedure top_check_func();