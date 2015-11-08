

-- load the regular members with non null and null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, id, firstname, lastname, 1, 1, 0, sysdate() from jos_comprofiler where cb_membertype = 'Regular';

-- load the linked members with non null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, cb_memberid, firstname, lastname, 1, 2, 0, sysdate() from jos_comprofiler where cb_memberid is not null and cb_membertype = 'Linked';

