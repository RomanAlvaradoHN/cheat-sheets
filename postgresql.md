# DATABASE ROLES

Go to [this link](https://www.postgresql.org/docs/current/user-manag.html) to see official information.

PostgreSQL manages database access permissions using the concept of **roles**. A role can be thought of as either a database user, or a group of database users, depending on how the role is set up.  
Roles can own database objects (for example, tables and functions) and can assign privileges on those objects to other roles to control who has access to which objects. **Furthermore, it is possible to grant membership in a role to another role, thus allowing the member role to use privileges assigned to another role.**  

**The concept of roles subsumes the concepts of “users” and “groups”.** In PostgreSQL versions before 8.1, users and groups were distinct kinds of entities, but now there are only roles. Any role can act as a user, a group, or both.

## User Creation Commands

1. Create role:  
`create role [rolename];`  
`create role [rolename] LOGIN;`  
`create user [rolename];`  this command includes the LOGIN privilege by default.  
`create role [rolename] password '[password_string]';`

	> #### Note  
	> Only roles that have the **LOGIN** attribute can be used as the initial role name for a database connection.  
	> A role with the LOGIN attribute can be considered the same as a “database user”.

2. Remove an existing role:  
`drop role [rolename]`

3. To determine the set of existing roles, examine the `pg_roles` system catalog:  
`select * from pg_roles;`





``` sql
--create user and password (implicit login)
create user [username] with password [password];  

--create user without password.
create user [username] with login;  
```


# GRANT CONNECT TO A DATABASE

``` sql
grant connect on database [database] to [username];  
```

# GRANT USAGE TO A SCHEMA

``` sql
grant usage on schema [schema_name] to [username];
```

# GRANT PRIVILEGES TO A USER

``` sql
grant select, insert, update, delete on all tables in schema public to [username];  

OR  

grant all privileges on all tables in schema public to [username];  
```

# GRANT ROLE TO A USER

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
