# Docker Engine

Go to [this link](https://docs.docker.com/engine/install/) to see the most recent instructions.

##  Installation Steps

1. Uninstall old versions:  
`apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)`

2. Set up Docker's apt repository:  
`sudo apt update`  
`sudo apt install ca-certificates curl`  
`sudo install -m 0755 -d /etc/apt/keyrings`  
`sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc`  
`sudo chmod a+r /etc/apt/keyrings/docker.asc`  
  
    ```[bash]
    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF  
    Types: deb  
    URIs: https://download.docker.com/linux/ubuntu  
    Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")  
    Components: stable  
    Signed-By: /etc/apt/keyrings/docker.asc  
    EOF
    ```  
`sudo apt update`  


3. Install the latest version:  
`sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`  

4. Verify the service:  
`sudo systemctl status docker`  

5. Verify installation:  
`sudo docker run hello-world`


## DOCKER COMMANDS

| Command             | Meaning                |
| :------             | :------                |
| `the-command`       | The command meaning    |