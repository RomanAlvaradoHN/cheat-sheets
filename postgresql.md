# DATABASE ROLES

Go to [this link](https://www.postgresql.org/docs/current/user-manag.html) to see official information.

PostgreSQL manages database access permissions using the concept of **roles**. A role can be thought of as either a database user, or a group of database users, depending on how the role is set up.  
Roles can own database objects (for example, tables and functions) and can assign privileges on those objects to other roles to control who has access to which objects. **Furthermore, it is possible to grant membership in a role to another role, thus allowing the member role to use privileges assigned to another role.**  

**The concept of roles subsumes the concepts of “users” and “groups”.** In PostgreSQL versions before 8.1, users and groups were distinct kinds of entities, but now there are only roles. Any role can act as a user, a group, or both.

## Role Management Commands

	### 1. Create role:  

		``` sql
		create role [rolename];
		```
		``` sql
		create role [rolename] LOGIN;
		```
		``` sql
		-- this command includes the LOGIN privilege by default.
		create user [rolename];
		```
		``` sql
		create role [rolename] password '[password_string]';
		```

		## Note  
		> Only roles that have the **LOGIN** attribute can be used as the initial role name for a database  
		> connection.  
		> A role with the LOGIN attribute can be considered the same as a “database user”.

2. Remove an existing role:  
	``` sql
	drop role [rolename];
	```

3. To determine the set of existing roles, examine the `pg_roles` system catalog:  
	``` sql
	select * from pg_roles;
	```

2. Role Membership:  
	It is frequently convenient to group users together to ease management of privileges: that way, privileges  
	can be granted to, or revoked from, a group as a whole.  
	PostgreSQL this is done by creating a role that represents the group, and then granting membership in the  
	group role to individual user roles.

	To set up a group role:

	1. Create the role:  
		``` sql
		create role [rolename];
		```

		Typically a role being used as a group would not have the LOGIN attribute, though you can set it if you  wish.

	2. Once the group role exists, you can add and remove members using the GRANT and REVOKE commands:  
		``` sql
		grant [group_role] to [rolename];
		```
		``` sql
		revoke [group_role] from [rolename];
		```


# DATABASE PRIVILEGES

## Grants

``` sql
-- To allow user to connect to a database:
grant connect on database [database] to [rolename];
```

``` sql
-- To allow a user work in a schema:
grant usage on schema [schema_name] to [rolename];  
```

``` sql
-- To allow CRUD operations to a user:
grant select, insert, update, delete on all tables in schema public to [rolename];
```

``` sql
-- To know which tables a user doesn't have permission:
select schemaname, tablename  
from pg_tables  
where
	schemaname not in ('pg_catalog', 'information_schema')  
	and has_table_privilege('[rolename]', schemaname || '.' || tablename, 'select') = false
;
```

``` sql
-- To grant select on sequences:
grant select on all sequences in schema public to [rolename];
```

``` sql
-- To grant default privileges to new tables:
-- Must be logged as administrator user and execute this two queries
grant [database] to [admin_user];

alter default privileges in schema public for role [database]
	grant select, insert, update, delete on tables to [rolename];
```




## Revoke

``` sql
-- To revoke connect privilege (login capabilities):
revoke connect on database [database] from [rolename];
```

``` sql
-- To revoke schema privilege:
revoke usage on schema [schema_name] from [rolename];
```

``` sql
-- To revoke CRUD privilege:
revoke select, insert, update, delete on all tables in schema public from [rolename];
```


# CUSTOM QUERIES


``` sql
--To see users and which databses they are allowed to connect:
select 
    r.rolname  as username
    ,d.datname as database
from
	pg_database         d
	cross join pg_roles r
where
	has_database_privilege(r.rolname, d.datname, 'CONNECT') = true
	and d.datistemplate = false 
	and r.rolcanlogin   = true
	and r.rolname       = '[rolename]'
order by
	username
;
```


``` sql
--To see user CRUD permissions on tables:
select 
    grantee        as rolename,
    table_schema   as schema,
    table_name     as table,
    privilege_type as CRUD
from 
    information_schema.role_table_grants 
where 
    grantee = '[rolename]' 
    --and privilege_type = 'UPDATE'
;
```


``` sql
--To see user membership:
select 
	u.rolname  as rolename
    ,m.rolname as group  
from
	pg_auth_members a
	join pg_roles   m on a.roleid = m.oid
	join pg_roles   u on a.member = u.oid
where
	u.rolname = '[rolename]';
;
```

``` sql
--To see user privileges and grants:
select has_schema_privilege('[rolename]', '[schema]', 'USAGE');
select has_table_privilege('[rolename]', '[schema].[table]', '[select|insert|update|delete]');

-- or

--to validate CRUD privileges and schema usage:
select
	has_schema_privilege('[rolename]', '[schema]', 'USAGE')          as schema_usage
	,has_table_privilege('[rolename]', '[schema].[table]', 'select') as grant_select
	,has_table_privilege('[rolename]', '[schema].[table]', 'update') as grant_update
	,has_table_privilege('[rolename]', '[schema].[table]', 'insert') as grant_insert
	,has_table_privilege('[rolename]', '[schema].[table]', 'delete') as grant_delete
;
```