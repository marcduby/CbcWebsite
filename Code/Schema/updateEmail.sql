

update member mem
left join jos_users us on
    mem.member_id = us.id
set
    mem.email = us.email, mem.username = us.username, mem.password = us.password;
    
    
update member mem
left join jos_comprofiler jc on
    mem.member_id = jc.id
set
    mem.address_street1 = jc.cb_street1,
    mem.address_street2 = jc.cb_street2,
    mem.address_city = jc.cb_city,
    mem.address_state = jc.cb_state,
    mem.address_zip_code = jc.cb_zip,
    mem.address_country = jc.cb_country,
    mem.address_phone_primary = jc.cb_primaryphone,
    mem.address_phone_secondary = jc.cb_secondaryphone,
    mem.member_since = jc.cb_membersince;
    
    
    