# CREATE USERS

``` sql
--create a user and password (implicit login)
create user [username] with password [password];  

--create a user witout password.
create user [username] with login;  
```


# GRANT CONNECT TO A DATABASE

``` sql
grant connect on database [database] to [username];  
```

# GRANT PRIVILEGES TO A USER

``` sql
grant select, insert, update, delete on all tables in schema public to [username];  

OR  

grant all privileges on all tables in schema public to [username];  
```

# GRANT ROLS TO A USER

``` sql
grant [role_name] to [username];  
```



# TO SEE DATABASE USERS

``` sql
select 
    r.rolname  as username
    ,d.datname as database
	,has_database_privilege(r.rolname, d.datname, 'CONNECT') as has_connect
from
	pg_database         d
	cross join pg_roles r
where
	d.datistemplate   = false 
	and r.rolcanlogin = true
	and r.rolname     = coalesce(:user_name, r.rolname)
order by
	username
;
```





# REVOKE PRIVILEGES TO USER

``` sql
revoke privilege select on schema public from [username];  
```

# TO SEE DATABASES

``` sql
select * from pg_database where datistemplate = false;
```

# TO SEE ROLES

``` sql
select * from pg_roles;
```
