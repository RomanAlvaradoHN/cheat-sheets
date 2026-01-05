# DATABASE ROLES

Go to [this link](https://www.postgresql.org/docs/current/user-manag.html) to see official information.

PostgreSQL manages database access permissions using the concept of **roles**. A role can be thought of as either a database user, or a group of database users, depending on how the role is set up.  
Roles can own database objects (for example, tables and functions) and can assign privileges on those objects to other roles to control who has access to which objects. **Furthermore, it is possible to grant membership in a role to another role, thus allowing the member role to use privileges assigned to another role.**  

**The concept of roles subsumes the concepts of “users” and “groups”.** In PostgreSQL versions before 8.1, users and groups were distinct kinds of entities, but now there are only roles. Any role can act as a user, a group, or both.

## Role Management Commands

1. Create role:  
	`create role [rolename];`  
	`create role [rolename] LOGIN;`  
	`create user [rolename];`  this command includes the LOGIN privilege by default.  
	`create role [rolename] password '[password_string]';`

	### Note  

	> Only roles that have the **LOGIN** attribute can be used as the initial role name for a database  
	> connection.  
	> A role with the LOGIN attribute can be considered the same as a “database user”.

2. Remove an existing role:  
	`drop role [rolename];`  

3. To determine the set of existing roles, examine the `pg_roles` system catalog:  
	`select * from pg_roles;`

2. Role Membership:  
	It is frequently convenient to group users together to ease management of privileges: that way, privileges  
	can be granted to, or revoked from, a group as a whole.  
	PostgreSQL this is done by creating a role that represents the group, and then granting membership in the  
	group role to individual user roles.

	To set up a group role:

	1. Create the role:  
		`create role [rolename];`  

		Typically a role being used as a group would not have the LOGIN attribute, though you can set it if you  wish.

	2. Once the group role exists, you can add and remove members using the GRANT and REVOKE commands:  
		`grant [group_role] to [rolename];`  
		`revoke [group_role] from [rolename];`  


# DATABASE PRIVILEGES

#### Grants

- To allow user to connect to a database:  
`grant connect on database [database] to [username];`  

- To allow a user work in a schema:  
`grant usage on schema [schema_name] to [username];`  

- To allow CRUD operations to a user:  
`grant select, insert, update, delete on all tables in schema public to [username];`  

#### Revoke

- To revoke connect privilege (login capabilities):  
`revoke connect on database [database] from [username];`  

- To revoke schema privilege:  
`revoke usage on schema [schema_name] from [username];`  

- To revoke CRUD privilege:
`revoke select, insert, update, delete on all tables in schema public from [username];`


# CUSTOM QUERIES

- To see users and which databses they are allowed to connect:  
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

- To see user CRUD permissions on tables:  
``` sql
SELECT 
    grantee AS usuario,
    table_schema AS esquema,
    table_name AS tabla,
    privilege_type AS tipo_permiso
FROM 
    information_schema.role_table_grants 
WHERE 
    grantee = '[username]' 
    --and privilege_type = 'UPDATE'
;
```