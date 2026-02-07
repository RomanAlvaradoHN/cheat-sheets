# AWS-CLI

## Installation Steps

Go to [this link](https://docs.aws.amazon.com/en_us/cli/latest/userguide/getting-started-install.html) to see the most recent information.

1. You need to ensure you have uninstalled any previous versions:  
    ```bash
    sudo apt remove awscli
    ```

2. Download the compressed file:  
    ```bash
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    ```

3. Unzip the downloaded file:  
    ```bash
    unzip awscliv2.zip
    ```

4. Install aws-cli:  
    ```bash
    sudo ./aws/install
    ```

5. Restart the shell:  
    ```bash
    source ~/.bashrc
    ```

6. Verify installation:  
    ```bash
    aws --version
    ```

# AWS-VAULT

## Installation Steps

Go to [this link](https://github.com/ByteNess/aws-vault) to see the most recent information.

1. Download the latest binary version from [this link.](https://github.com/byteness/aws-vault/releases/latest)
    ```bash
    curl -L -o /usr/local/bin/aws-vault https://github.com/ByteNess/aws-vault/releases/download/v7.9.3/aws-vault-linux-amd64
    ```

2. Add execution rights:
    ```bash
    sudo chmod +x /usr/local/bin/aws-vault
    ```

3. Add the environment variables and aliases:  
    ```bash
    echo "\\r\\r" >> ~/.bashrc
    echo "#aws-vault configs =================================" >> ~/.bashrc
    echo "AWS_VAULT_BACKEND=file" >> ~/.bashrc
    echo "alias av='aws-vault'" >> ~/.bashrc
    echo "alias ave='aws-vault exec'" >> ~/.bashrc
    ```

4. Apply configs:  
    ```bash    
    source ~/.bashrc
    ```

## AWS-VAULT COMMANDS

| Command                                             |Meaning                                      |
| :------                                             | :------                                     |
| `aws-vault add [profile-name]`                      | Adds a profile to the vault                 |
| `aws-vault list`                                    | To see added profiles                       |
| `aws-vault exec [profile-name] --duration=[hours]h` | Set up a profile session                    |
| `aws-vault rm [profile-name]`                       | To delete a profile                         |
