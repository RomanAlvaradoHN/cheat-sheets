# ANSIBLE


## Installation Steps

Go to [this link](https://docs.ansible.com/projects/ansible/latest/installation_guide/intro_installation.html) to see the most recent information.

1. Ensure `pip` is available:  
`python3 -m pip -V`

2. Install Ansible:  

| Command                                            | Description                                                   |
| :------                                            | :----------                                                   |
| python3 -m pip install --user ansible              | Install the full Ansible package for the current user         |
| python3 -m pip install --user ansible-core         | Install the minimal ansible-core package for the current user |
| python3 -m pip install --user ansible-core==2.12.3 | Install a specific version of ansible-core                    |

3. Verify Installation
`ansible --version`


___


# Para correr localmente un playbook
ansible-playbook -vvv  ./playbooks/web_build_env_local.yml  -e "jenkins_workspace=." -e "app_repo_name=wgsn-web" -l 'prod'


ansible-playbook -v ./playbooks/build_env.yml -e "env_file=coloro-marketing-cn" -e "jenkins_workspace=/var/lib/jenkins/temp" -l "prod"

# para borrar /temp/ de los workders
ansible web -b -m shell -a "rm -rfv /tmp/*" -l 'prod-wgsn-worker0*'

ansible web -b -m file -a "path=/tmp/ state=absent" -l 'prod-wgsn-worker*'
ansible web -b -m file -a "path=/tmp/ state=absent" -l 'dev-wgsn-worker*'
ansible web -b -m file -a "path=/tmp/ state=absent" -l 'qa-wgsn-worker*'

# Copy a dir from local to remoteHost
/home/isaula/Documents/NEW/dpkg-licenses
/home/ops/

ansible all -b -m copy -a 'src=/home/isaula/Documents/NEW/dpkg-licenses dest=/home/ops/' -l 'dev-wgsn-icarcamo.use1.wgsndev.com' --list-hosts

ansible all -b -m copy -a 'src=/home/NEW/dpkg-licenses dest=/home/ops/' -l 'dev-vms.com' --list-hosts
# DEV
ansible all -b -m template -a "src=roles/nginx/templates/conf.d/active_develop_wgsndev.com.conf.j2 dest=/etc/nginx/conf.d/wgsndev.com.conf mode=0644  backup=yes" -l 'develop:&dev-wgsn-web0*'
# Restar the service
ansible all -b -m service -a "name=nginx state=restarted" -l 'develop:&dev-wgsn-web0*'


# DEV_VMs
ansible all -b -m template -a "src=roles/nginx/templates/conf.d/active_devvm_wgsn.com.conf.j2 dest=/etc/nginx/conf.d/wgsndev.com.conf mode=0644  backup=yes" -l 'developer_servers:&wgsn'

ansible all -b -m service -a "name=nginx state=restarted" -l 'developer_servers:&wgsn'

# QA
ansible all -b -m template -a "src=roles/nginx/templates/conf.d/active_qa_wgsn.com.conf.j2 dest=/etc/nginx/conf.d/wgsndev.com.conf mode=0644 backup=yes" -l 'qa:&qa-wgsn-web0*'
ansible all -b -m service -a "name=nginx state=restarted`" -l 'qa-wgsn-web0*'

# CANARY
ansible all -b -m template -a "src=roles/nginx/templates/conf.d/active_canary_wgsn.com.conf.j2 dest=/etc/nginx/conf.d/wgsn.com.conf mode=0644 backup=yes" -l 'prod-wgsn-canary001*'
ansible all -b -m service -a "name=nginx state=restarted" -l 'prod-wgsn-canary001*'

# PLATFORM
ansible web -b -m template -a "src=roles/nginx/templates/conf.d/active_staging_wgsn.com.conf.j2 dest=/etc/nginx/conf.d/wgsn.com.conf mode=0644 backup=yes" -l 'prod-wgsn-canary002*'
ansible web -b -m service -a "name=nginx state=restarted" -l 'prod-wgsn-canary002*'


# leave this for after
# use 'reloaded' instead
PROD USE1
ansible all -b -m template -a "src=roles/nginx/templates/conf.d/active_prod_use1_wgsn.com.conf.j2 dest=/etc/nginx/conf.d/wgsn.com.conf mode=0644 backup=yes" -l 'prod:&prod-wgsn-web0*'
# reload nginx one by one
ansible all -b -m service -a "name=nginx state=reloaded" -l 'prod-wgsn-web005.use1.wgsndev.com' --list-hosts

# Going incremental 
prod-wgsn-web002
prod-wgsn-web003
prod-wgsn-web004
prod-wgsn-web005

prod-wgsn-web001.use1.wgsndev.com
prod-wgsn-web005.use1.wgsndev.com
prod-wgsn-web003.use1.wgsndev.com
prod-wgsn-web004.use1.wgsndev.com
prod-wgsn-web002.use1.wgsndev.com


##
## mgmt-jenkins-agent001
## mgmt-jenkins-agentcn001
## user: jenkins
## Enter into Jenkins agent to run follow commands:
##
# PROD APNE1
ansible all -b -m template -a "src=roles/web/templates/nginx/conf.d/active_prod_apne1_wgsn.com.conf.j2 dest=/etc/nginx/conf.d/wgsn.com.conf mode=0644 backup=yes" -l 'prod_apne1:&prod-wgsn-web0*' 

ansible all -b -m service -a "name=nginx state=reloaded" -l 'prod_apne1:&prod-wgsn-web0*'
ansible all -b -m service -a "name=nginx state=restarted" -l 'prod_apne1:&prod-wgsn-web0*' 

# PROD APNE1 CN
ansible all -b -m template -a "src=roles/nginx/templates/conf.d/active_prod_cn_wgsn.com.conf.j2 dest=/etc/nginx/conf.d/wgsn.com.conf mode=0644 backup=yes" -l 'prod_apne1:&prod-wgsn-webcn0*'

ansible all -b -m service -a "name=nginx state=reloaded" -l 'prod_apne1:&prod-wgsn-webcn0*' 
ansible all -b -m service -a "name=nginx state=restarted" -l 'prod_apne1:&prod-wgsn-webcn0*'
