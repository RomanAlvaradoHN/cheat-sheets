# REDSHIFT COMMANDS

#### CREATE:  

* [DATABASE](https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_DATABASE.html)  

    ``` sql
    CREATE DATABASE database_name 
    [
        {
            [ 
                FROM INTEGRATION '<integration_id>'[ DATABASE '<source_database>' ]
                [ SET ]
                [ ACCEPTINVCHARS [=] { TRUE | FALSE }]
                [ QUERY_ALL_STATES [=] { TRUE | FALSE }] 
                [ REFRESH_INTERVAL <interval> ] 
                [ TRUNCATECOLUMNS [=] { TRUE | FALSE } ]
                [ HISTORY_MODE [=] {TRUE | FALSE} ]
            ]
            [ WITH ]
            [ OWNER [=] db_owner ]
            [ CONNECTION LIMIT { limit | UNLIMITED } ]
            [ COLLATE { CASE_SENSITIVE | CS | CASE_INSENSITIVE | CI } ]
            [ ISOLATION LEVEL { SNAPSHOT | SERIALIZABLE } ]
        }
        | { FROM { { ARN '<arn>' } { WITH DATA CATALOG SCHEMA '<schema>' | WITH NO DATA CATALOG SCHEMA } } }
        | { IAM_ROLE  {default | 'SESSION' | 'arn:aws:iam::<account-id>:role/<role-name>' } }
        | { [ WITH PERMISSIONS ] FROM DATASHARE datashare_name OF [ ACCOUNT account_id ] NAMESPACE namespace_guid }
    ]
    ```

* [SCHEMA](https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_SCHEMA.html)
	``` sql
    CREATE SCHEMA [ IF NOT EXISTS ] schema_name [ AUTHORIZATION username ]
	```

* [USER](https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html)
	``` sql
    CREATE USER name [ WITH ]
    PASSWORD { 'password' | 'md5hash' | 'sha256hash' | DISABLE }
    [ option [ ... ] ]

    where option can be:

    CREATEDB | NOCREATEDB
    | CREATEUSER | NOCREATEUSER
    | SYSLOG ACCESS { RESTRICTED | UNRESTRICTED }
    | IN GROUP groupname [, ... ]
    | VALID UNTIL 'abstime'
    | CONNECTION LIMIT { limit | UNLIMITED }
    | SESSION TIMEOUT limit
    | EXTERNALID external_id
	```

    ``` sql
    --Create IAM user/role (for IAM authentication)
	CREATE USER "IAM:[IAM_user_or_role]" PASSWORD DISABLE;
	```

* [ROLE](https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_ROLE.html)
	``` sql
    CREATE ROLE role_name
    [ EXTERNALID external_id ]
	```

#### GRANT PRIVILEGES:  

Go to [this link](https://docs.aws.amazon.com/redshift/latest/dg/r_GRANT.html) to see official information.

* DABABASE-LEVEL PRIVILEGES
    ``` sql
    GRANT { { CREATE | USAGE | TEMPORARY | TEMP | ALTER } [,...] | ALL [ PRIVILEGES ] }
    ON DATABASE db_name [, ...]
    TO { username [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]
    ```

* SCHEMA-LEVEL PRIVILEGES
    ``` sql
    GRANT { { CREATE | USAGE | ALTER | DROP } [,...] | ALL [ PRIVILEGES ] }
    ON SCHEMA schema_name [, ...]
    TO { username [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]
    ```

* TABLES-LEVEL PRIVILEGES
    ``` sql
    GRANT { { SELECT | INSERT | UPDATE | DELETE | DROP | REFERENCES | ALTER | TRUNCATE } [,...] | ALL [ PRIVILEGES ] }
    ON { [ TABLE ] table_name [, ...] | ALL TABLES IN SCHEMA schema_name [, ...] }
    TO { username [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]
    ```

* FUNCTIONS-LEVEL PRIVILEGES
    ``` sql
    GRANT { EXECUTE | ALL [ PRIVILEGES ] }
    ON { FUNCTION function_name ( [ [ argname ] argtype [, ...] ] ) [, ...] | ALL FUNCTIONS IN SCHEMA schema_name [, ...] }
    TO { username [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]
    ```

* PROCEDURES-LEVEL PRIVILEGES
    ``` sql
    GRANT { EXECUTE | ALL [ PRIVILEGES ] }
    ON { PROCEDURE procedure_name ( [ [ argname ] argtype [, ...] ] ) [, ...] | ALL PROCEDURES IN SCHEMA schema_name [, ...] }
    TO { username [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]
    ```

* OTHERS
    ``` sql
    GRANT USAGE
    ON LANGUAGE language_name [, ...]
    TO { username [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]             
    ```

    ``` sql
    GRANT { { ALTER | DROP} [,...] | ALL [ PRIVILEGES ] }
    ON COPY JOB job_name [,...]
    TO { username [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]
    ```

    ``` sql
    GRANT { { ALTER | DROP | USAGE } [,...] | ALL [ PRIVILEGES ] }
    ON TEMPLATE [database_name.][schema_name.]template_name [,...]
    TO { username [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]
    ```

#### DEFAULT PRIVILEGES:  

Go to [this link](https://docs.aws.amazon.com/redshift/latest/dg/r_ALTER_DEFAULT_PRIVILEGES.html) to see official information.

``` sql
ALTER DEFAULT PRIVILEGES
[ FOR USER target_user [, ...] ]
[ IN SCHEMA schema_name [, ...] ]
grant_or_revoke_clause

where grant_or_revoke_clause is one of:

GRANT { { SELECT | INSERT | UPDATE | DELETE | DROP | REFERENCES | TRUNCATE } [,...] | ALL [ PRIVILEGES ] }
ON TABLES
TO { user_name [ WITH GRANT OPTION ] | ROLE role_name | GROUP group_name | PUBLIC } [, ...]

GRANT { EXECUTE | ALL [ PRIVILEGES ] }
ON FUNCTIONS
TO { user_name [ WITH GRANT OPTION ] |  ROLE role_name | GROUP group_name | PUBLIC } [, ...]

GRANT { EXECUTE | ALL [ PRIVILEGES ] }
ON PROCEDURES
TO { user_name [ WITH GRANT OPTION ] |  ROLE role_name | GROUP group_name | PUBLIC } [, ...]

REVOKE [ GRANT OPTION FOR ] { { SELECT | INSERT | UPDATE | DELETE | REFERENCES | TRUNCATE } [,...] | ALL [ PRIVILEGES ] }
ON TABLES
FROM user_name [, ...] [ RESTRICT ]

REVOKE  { { SELECT | INSERT | UPDATE | DELETE | REFERENCES | TRUNCATE } [,...] | ALL [ PRIVILEGES ] }
ON TABLES
FROM { ROLE role_name | GROUP group_name | PUBLIC } [, ...] [ RESTRICT ]

REVOKE [ GRANT OPTION FOR ] { EXECUTE | ALL [ PRIVILEGES ] }
ON FUNCTIONS
FROM user_name [, ...] [ RESTRICT ]

REVOKE { EXECUTE | ALL [ PRIVILEGES ] }
ON FUNCTIONS
FROM { ROLE role_name | GROUP group_name | PUBLIC } [, ...] [ RESTRICT ]

REVOKE [ GRANT OPTION FOR ] { EXECUTE | ALL [ PRIVILEGES ] }
ON PROCEDURES
FROM user_name [, ...] [ RESTRICT ]

REVOKE { EXECUTE | ALL [ PRIVILEGES ] }
ON PROCEDURES
FROM { ROLE role_name | GROUP group_name | PUBLIC } [, ...] [ RESTRICT ]
```

``` sql
--DEFAULT USER SCHEMA
ALTER USER [username] SET SEARCH_PATH TO [schemaname] [,...];

```


#### PRIVILEGES AUDIT:  

* TO SEE USERS
    ``` sql
    SELECT * FROM PG_USER;
    ```

* TO SEE ROLES
    ``` sql
    SELECT * FROM SVV_ROLES;
    ```

* TO SEE ROLE'S USERS
    ``` sql
    SELECT * FROM SVV_USER_GRANTS
    ```

* TO SEE USER/ROLE DATABASE PRIVILEGES
    ``` sql
    SELECT * FROM SVV_DATABASE_PRIVILEGES;
    ```

* TO SEE USER/ROLE SCHEMA PRIVILEGES
    ``` sql
    SELECT * FROM SVV_SCHEMA_PRIVILEGES;
    ```

* TO SEE DEFAULT PRIVILEGES
    ``` sql
    SELECT * FROM SVV_DEFAULT_PRIVILEGES;
    ```


* TO SEE DEFAULT PRIVILEGES (CUSTOM)
    ``` sql
    select
	schema_name
	,object_type
	,owner_name
	,privilege_type
	,grantee_name
    from
        svv_default_privileges dfp
        inner join pg_user usr on usr.usename = dfp.owner_name
    order by owner_name, object_type desc, privilege_type;
    ```

* TO SEE SCHEMAS OWNERS
    ``` sql
    select nspname as schema, usename as owner
    from pg_namespace, pg_user
    where pg_namespace.nspowner = pg_user.usesysid
    ```