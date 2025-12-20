# Connection Strings

The connection string, uses the format: **<username>:<password>@<host>**


# Switch database

`use <database-name>`

# Create User
```[json]
db.createUser(
  {
    user: "<username>",
    pwd: "<password>",
    roles: [ "<role>" ]
  }
)
```

# Grant Access to User On a Database

`db.grantRolesToUser("dev-readdb", [{role:"read", db: "social-trend-analytics"}]);

# Revoke Access To User On A Database
db.revokeRolesFromUser("dev-readdb", [{ role: "read", db: "admin" }]);