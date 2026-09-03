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

The `/etc/passwd` file contains the users information (separated by `:`).  

part1:part2:part3:part4:part5:part6:part7

- part1: Login name.
- part2: Password identification, x indicates that the user has password, the encrypted password is stored in the second field of `/etc/shadow`.
- part3: UID (User's ID).
- part4: GID (User's primary group ID).
- part5: Comments.
- part6: Home directory.
- part7: Shell.


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

The `/etc/group` file contains the groups information (separated by `:`).  

part1:part2:part3:part4  

- part1: Name of the group.
- part2: The group password (identified by x). The group password is stored in `/etc/gshadow`.
- part3: GID (Group ID)
- part4: Supplementary users in the group. (excluding the unique primary user).


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


