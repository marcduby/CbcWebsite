

-- lookup tables
-- locker type table
drop table if exists locker_type;
create table locker_type (
    locker_type_id int(9) not null,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into locker type table
insert into locker_type values(1, 'Men full locker', 'Full locker in men locker room');
insert into locker_type values(2, 'Men half locker', 'Half locker in men locker room');
insert into locker_type values(3, 'Women half locker', 'Half locker in women locker room');
    
-- member status lookup table
drop table if exists member_status;
create table member_status (
    member_status_id int(9) not null,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into member status table
insert into member_status values(1, 'Active', 'Member in active status, can use all facilities');
insert into member_status values(2, 'Inactive', 'Member in inactive status, cannot use all facilities');
insert into member_status values(3, 'Wait list', 'Member in inactive wait list status, cannot use all facilities');


-- member type lookup table
drop table if exists member_type;
create table member_type (
    member_type_id int(9) not null,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into member type table
insert into member_type values(1, 'Rowing member', 'Member is a rowing member, to be billed accordingly');
insert into member_type values(2, 'Social member', 'Member is a social member, to be billed accordingly');
    

-- rack type lookup table
drop table if exists rack_type;
create table rack_type (
    rack_type_id int(9) not null,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into rack type table
insert into rack_type values(1, 'Indoor rack', 'A full time rack contained within the walls of the building');
insert into rack_type values(2, 'Outdoor rack', 'A full time rack not contained within the walls of the building');
insert into rack_type values(3, 'Temporary rack', 'A rack only used for temporary storage');



-- transactional tables (will be modified regularly)
-- member application table
drop table if exists member_application;
create table member_application (
    member_application_id int(9) not null auto_increment primary key,
    first_name varchar(4000) not null,
    middle_name varchar(4000),
    last_name varchar(4000) not null,
    version bigint(19) not null default 0,
    date_created timestamp,
    last_updated date);

-- member table
drop table if exists member;
create table member (
    member_id int(9) not null auto_increment primary key,
    primary_member_id int(9) not null,
    first_name varchar(4000) not null,
    middle_name varchar(4000),
    last_name varchar(4000) not null,
    member_status_id int(9) not null default 1,
    member_type_id int(9) not null default 1,
    version bigint(19) not null default 0,
    date_created timestamp,
    last_updated date);


