# Node Version Manager

Go to [this link](https://www.nvmnode.com/guide/installation.html) to see the most recent instructions.

##  Installation Steps

1. Get the required files:  
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash`

2. Add the environment variables:  
`echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc`  
`echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc`  
`echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc`  

3. Restart the shell:  
`source ~/.bashrc`

4. Verify installation:  
`nvm --version`


## NVM COMMANDS

| Command                       | Meaning                                                        |
| :------                       | :------                                                        |
| `nvm install [version]`       | To install Node.js version                                     |
| `nvm use [version]`           | Switch to the Node-js specified version                        |
| `nvm alias default [version]` | Set a default Node.js version that will be automatically used. |
| `nvm current`                 | To check which Node.js version is currently being used         |
| `nvm ls`                      | To see what Node.js versions are installed.                    |


#### The Major Version Number.

Just specify the major version number, and NVM **will use or install the latest** version  
of that major version.  
Example:  
> nvm use 14  
> Using node v14.17.6 (npm v6.14.15)

#### Parameters options:
| Parameter          | Meaning               |
| :-----------       | :------               |
| node               | Latest stable version |
| lts/*              | Latest LTS version    |
| lts/\[lts-version] | Specific LTS version  |

## Automatic Version Switching with **.nvmrc** Files

Create a file named `.nvmrc` in your project's root directory with the Node.js version number as its content.  
Then, simply run the `nvm use` command (without arguments), and NVM will read the version from the `.nvmrc`  
file and switch to that version automatically.  

> echo "16.14.0" >> .nvmrc  
> nvm use