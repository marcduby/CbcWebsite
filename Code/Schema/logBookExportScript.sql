

-- output data for Jim's log book work
select member_id, primary_member_id, first_name, last_name, web_name as member_type
    from member mem, member_status mem_status
    where mem.member_status_id  = mem_status.member_status_id;
    