# LINUX USERS AND GROUPS MANAGEMENT  

## USERS

### CREATE USER  

```bash
#create user only
sudo useradd -s /bin/bash [username]
```  

```bash
#create user and home directory (-m)
sudo useradd -s /bin/bash -m [username]
```  

```bash
#create user with comment
sudo useradd -s /bin/bash -m -c "[comment]" [username]
```  

```bash
#set user password
sudo passwd [username]
```  

```bash
# full command
username="testuser"
comment="comment test user"
ssh_key="helloworld"
sudo useradd -s /bin/bash -m -c $comment $username
sudo mkdir /home/$username/.ssh
sudo echo $ssh_key > /home/$username/.ssh/authorized_keys
sudo chown -R $username:$username /home/$username
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


