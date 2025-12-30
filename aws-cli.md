# Installation Steps

Go to [this link](https://docs.aws.amazon.com/en_us/cli/latest/userguide/getting-started-install.html) to see the most recent information.

1. You need to ensure you have uninstalled any previous versions:  
`sudo apt remove awscli`

2. Download the compressed file:  
`curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"`

3. Unzip the downloaded file:  
`unzip awscliv2.zip`

4. Install aws-cli:  
`sudo ./aws/install`

5. Add the environment variable:  
`export AWS_VAULT_BACKEND=file >> ~/.bashrc`

6. Verify the installation:  
`aws --version`

### Optional steps

7. customize commands:  
```[bash]
echo "alias av='aws-vault' >> ~/.bashrc
echo "alias ave='aws-vault exec' >> ~/.bashrc
source ~/.bashrc
```
    

### COMMANDS

- Add a profile:  
`aws-vault add [profile-name]`

- Set up a profile session:  
`aws-vault exec [profile-name] --duration=[hours]h`