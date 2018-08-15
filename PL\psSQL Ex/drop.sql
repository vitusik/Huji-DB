drop trigger if exists rating_update_trig on match cascade;
drop trigger if exists active_check on match cascade;
drop trigger if exists top_check on player cascade;
drop trigger if exists loc_check on location cascade;
drop function if exists rating_update_func() cascade;
drop function if exists active_check_func() cascade;
drop function if exists top_check_func() cascade;
drop function if exists loc_check_func() cascade;
drop function if exists reactivate() cascade; 