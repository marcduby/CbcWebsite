
-- clean up the old wen site table
update jos_comprofiler set cb_memberid = 1680 where id = 2013;       -- richards
update jos_comprofiler set cb_memberid = 1623 where id = 2105;       -- wood
update jos_comprofiler set cb_memberid = 1882 where id = 1979;       -- watkins
update jos_comprofiler set cb_memberid = 1649 where id = 2011;       -- j pierce
update jos_comprofiler set cb_memberid = 1117 where id = 2082;       -- chenausky
update jos_comprofiler set cb_memberid = 1284 where id = 2036;       -- grant
update jos_comprofiler set cb_memberid = 2005 where id = 2093;       -- collins
update jos_comprofiler set cb_memberid = 1745 where id = 2083;       -- sciascia
update jos_comprofiler set cb_memberid = 1224 where id = 2037;       -- flanders
update jos_comprofiler set cb_memberid = 1740 where id = 1994;       -- schock
update jos_comprofiler set cb_memberid = 2072 where id = 2073;       -- cooley
update jos_comprofiler set cb_memberid = 1198 where id = 2039;       -- egan
update jos_comprofiler set cb_memberid = 1182 where id = 2038;       -- douglass
update jos_comprofiler set cb_memberid = 2062 where id = 2090;       -- cusack
update jos_comprofiler set cb_memberid = 1351 where id = 2068;       -- bakinowsky
update jos_comprofiler set cb_memberid = 2016 where id = 2031;       -- walsh
update jos_comprofiler set cb_memberid = 1562 where id = 2069;       -- duerr
update jos_comprofiler set cb_memberid = 1943 where id = 1990;       -- kennelly



-- delete all member rows to start
delete from member;

-- load the regular/admin members with non null and null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, id, firstname, lastname, 1, 1, 0, sysdate() from jos_comprofiler where cb_membertype = 'Regular' or cb_membertype = 'Admin';

-- load the linked members with non null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, cb_memberid, firstname, lastname, 1, 2, 0, sysdate() from jos_comprofiler where cb_memberid is not null and cb_membertype = 'Linked';
    
-- load the inactive members with non null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, id, firstname, lastname, 2, 1, 0, sysdate() from jos_comprofiler where cb_membertype = 'Inactive';

-- load the wait list members with non null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, id, firstname, lastname, 3, 1, 0, sysdate() from jos_comprofiler where cb_membertype = 'Waitlist';

-- load the wait list members with non null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, id, firstname, lastname, 5, 1, 0, sysdate() from jos_comprofiler where cb_membertype = 'Senior';

-- load the former members with non null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, id, firstname, lastname, 6, 1, 0, sysdate() from jos_comprofiler where cb_membertype = 'Former';

-- load the wait list members with non null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, id, firstname, lastname, 7, 1, 0, sysdate() from jos_comprofiler where cb_membertype = 'Honorary';

-- load the wait list members with non null cb_memberid fields
insert into member (member_id, primary_member_id, first_name, last_name, member_status_id, member_type_id, version, last_updated)
    select id, id, firstname, lastname, 8, 1, 0, sysdate() from jos_comprofiler where cb_membertype = 'Honorary, Voting';

-- set HK to child type
update member set member_type_id = 3 where member_id = 1990;

