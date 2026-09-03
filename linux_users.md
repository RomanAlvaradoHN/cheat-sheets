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


## GROUPS  

Each user must have a group called the user's primary group.  
Several users can be part of the same group.  
Groups other than the primary group are called the user's supplementary
groups.  

### CREATE A GROUP  

```bash
groupadd [groupname]
```  


### DELETE A GROUP  

```bash
groupdel [groupname]
```  


### VIEW EXISTING GROUPS  

```bash
# full info
cat /etc/group
```  

```bash
# view user's groups
groups [username]
```  

```bash
# view users that belongs to a group
getent group [groupname]
```  




# FREE WEB VM  

[WebVM - Linux virtualization in WebAssembly](https://webvm.io/)


