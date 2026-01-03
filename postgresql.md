# CREATE NORMAL USER (USERNAME AND PASSWORD)

``` sql
create user [username] with password [password];  
grant connect on database [database] to [username];  
```

# CREATE PASSWORD-LESS USER (FOR IAM AUTHENTICATION)

``` sql
create user [username] with login;  
grant rds_iam to [username];  
--grant select, insert, update, delete on all tables in schema public to [username];  
--grant all privileges on all tables in schema public to [username];  
```

# TO LIST ALL USERS

``` sql
select rolname, rolsuper, rolcreaterole, rolcanlogin from pg_roles where rolcanlogin = true;  
```

# REVOKE PRIVILEGES TO USER

``` sql
revoke privilege select on schema public from [username];  
```
