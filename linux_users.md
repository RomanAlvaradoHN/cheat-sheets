# LINUX USERS AND GROUPS MANAGEMENT  

## USERS

### CREATE USER  

```bash
#create user, home directory and comment
sudo useradd -s /bin/bash -m -c "[comment]" [username]
```  

```bash
#create user only
sudo useradd -s /bin/bash [username]
```  

```bash
#create user and home directory (-m)
sudo useradd -s /bin/bash -m [username]
```  

```bash
#set user password
sudo passwd [username]
```  


### DELETE USER  

```bash
#delete user only
sudo userdel [username]
```  

```bash
#delete user and home directory
sudo userdel -r [username]
```  


### VIEW EXISTING USERS

```bash
# full data
cat /etc/passwd
```  

```bash
# only usernames
cat /etc/passwd | cut -d: -f1
```  


# FREE WEB VM  

[WebVM - Linux virtualization in WebAssembly](https://webvm.io/)


