# Basic SSH configurations


```bash
# Create a public/private key
ssh-keygen -t ed25519 -C "your-email@example.com" -f ./keyname
```

```[yaml]
# Host configurations ~/.ssh/config
Host [name-to-identifi-the-host]  
   HostName [domain-or-ip-address]  
   User [the-username]  
   IdentityFile [path-to-the-key]
```