
-- drop all tables
drop table if exists member;
drop table if exists groups;
drop table if exists member_application;
drop table if exists rack;
drop table if exists locker;
drop table if exists activity;
drop table if exists rack_type;
drop table if exists locker_type;
drop table if exists member_status;
drop table if exists member_type;
drop table if exists activity_type;
drop table if exists group_type;


-- lookup tables
-- locker type table
create table locker_type (
    locker_type_id int(9) not null primary key,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into locker type table
insert into locker_type values(1, 'Men full locker', 'Full locker in men locker room');
insert into locker_type values(2, 'Men half locker', 'Half locker in men locker room');
insert into locker_type values(3, 'Women half locker', 'Half locker in women locker room');
    
-- member status lookup table
create table member_status (
    member_status_id int(9) not null primary key,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into member status table
insert into member_status values(1, 'Active', 'Member in active status, can use all facilities');
insert into member_status values(2, 'Inactive', 'Member in inactive status, cannot use all facilities');
insert into member_status values(3, 'Wait list', 'Member in inactive wait list status, cannot use all facilities');


-- member type lookup table
create table member_type (
    member_type_id int(9) not null primary key,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into member type table
insert into member_type values(1, 'Rowing member', 'Member is a rowing member, to be billed accordingly');
insert into member_type values(2, 'Social member', 'Member is a social member, to be billed accordingly');
    
-- rack type lookup table
create table rack_type (
    rack_type_id int(9) not null primary key,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into rack type table
insert into rack_type values(1, 'Indoor rack', 'A full time rack contained within the walls of the building');
insert into rack_type values(2, 'Outdoor rack', 'A full time rack not contained within the walls of the building');
insert into rack_type values(3, 'Temporary rack', 'A rack only used for temporary storage');

-- group type lookup table
create table group_type (
    group_type_id int(9) not null primary key,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into group type table
insert into group_type values(1, 'Social', 'A social group');
insert into group_type values(2, 'Committee', 'A committee group for the club');
insert into group_type values(3, 'Volunteer', 'A group for volunteer activities');

-- activity type table
create table activity_type (
    activity_type_id int(9) not null primary key,
    web_name varchar(1000) not null,
    description varchar(4000));

-- insert rows into activity type table
insert into activity_type values(1, 'Volunteer', 'Volunteer activity');
insert into activity_type values(2, 'Social', 'Social activity');


-- transactional tables (will be modified regularly)
-- member application table
create table member_application (
    member_application_id int(9) not null auto_increment primary key,
    first_name varchar(4000) not null,
    middle_name varchar(4000),
    last_name varchar(4000) not null,
    version bigint(19) not null default 0,
    date_created timestamp,
    last_updated date);

-- rack table
create table rack (
    rack_id int(9) not null primary key,
    rack_type_id int(9) not null,
    web_name varchar(4000) not null,
    name varchar(4000) not null,
    version bigint(19) not null default 0,
    date_created timestamp,
    last_updated date,
    foreign key (rack_type_id) references rack_type(rack_type_id));

-- create 2 racks for links
insert into rack (rack_id, rack_type_id, web_name, name, last_updated) values(1, 1, 'Indoor rack', 'Generic indoor rack', sysdate());
insert into rack (rack_id, rack_type_id, web_name, name, last_updated) values(2, 2, 'Outdoor rack', 'Generic outdoor rack', sysdate());
insert into rack (rack_id, rack_type_id, web_name, name, last_updated) values(3, 3, 'Temporary rack', 'Generic temporary rack', sysdate());

-- locker table
create table locker (
    locker_id int(9) not null auto_increment primary key,
    locker_type_id int(9) not null,
    name varchar(4000) not null,
    version bigint(19) not null default 0,
    date_created timestamp,
    last_updated date);

-- group table
create table groups (
    group_id int(9) not null auto_increment primary key,
    group_type_id int(9) not null,
    name varchar(4000) not null,
    version bigint(19) not null default 0,
    date_created timestamp,
    last_updated date,
    foreign key (group_type_id) references group_type(group_type_id));
    
-- activity table
create table activity (
    activity_id int(9) not null auto_increment primary key,
    activity_type_id int(9) not null,
    group_id int(9) not null,
    name varchar(4000) not null,
    date_held date,
    has_bill_fee enum('Y', 'N') not null default 'N',
    bill_fee float(10,2) default 0.00,
    version bigint(19) not null default 0,
    date_created timestamp,
    last_updated date,
    foreign key (activity_type_id) references activity_type(activity_type_id),
    foreign key (group_id) references groups(group_id));

-- member table
create table member (
    member_id int(9) not null auto_increment primary key,
    primary_member_id int(9) not null,
    first_name varchar(4000) not null,
    middle_name varchar(4000),
    last_name varchar(4000) not null,
    member_status_id int(9) not null default 1,
    member_type_id int(9) not null default 1,
    locker_id int(9) null,
    version bigint(19) not null default 0,
    date_created timestamp,
    last_updated date,
    foreign key (member_status_id) references member_status(member_status_id),
    foreign key (member_type_id) references member_type(member_type_id),
    foreign key (locker_id) references locker(locker_id));







