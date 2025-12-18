# Install nvm (Node Version Manager)

Go to [NVM Documentation](https://www.nvmnode.com/guide/installation.html) to get the last version.
```[bash]
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm --version
```

# Installing Node Versions with NVM

Command: **`nvm install <node>`**  

Example:  
`nvm install 22.2.0`

or  
`nvm install 22` This way will install the latest version of the major version number "22".

# Checking the current version
> ```[bash]
> nvm current
> ```
> output:
>> v14.21.3

# Switching Node Versions with NVM

### List Available Node Versions

Before switching, you can use the **`nvm ls`** command to see what Node.js versions are installed.

NVM provides simple yet powerful commands to switch between different Node.js versions.  
The most basic command is **`nvm use <node>`**, which allows you to activate an installed Node.js version.

> ```[bash]
> nvm use 24.0.2
> ```
>> output:  
>> Now using node v24.0.2

#### Note:  
You can just specify the major version number, and NVM will use the latest installed  
version of that major version.
> ```[bash]
> nvm use 14
> ```
>> output:  
>> Now using node v14.21.3 (npm v6.14.18)

### Automatic Version Switching with .nvmrc Files

Create a file named **.nvmrc** in your project's root directory with the Node.js version  
number as its content.
Then, simply run the **`nvm use`** command (without arguments), and NVM will read the version  
from the .nvmrc file and switch to that version automatically.

> ```[bash]
> echo "16.14.0" > .nvmrc
> nvm use
> ```
>> output:  
>> Found '/path/to/project/.nvmrc' with version <16.14.0>
>> Now using node v16.14.0 (npm v8.3.1)

# Summary `nvm use` Command Parameters

| Parameter  | Description                                                 |
| :--------  | :---------------------------------------------------------- |
| <version> | Specifies the Node.js version to use      |
| node       | Uses the latest version of Node.js        |
| lts/*      | Uses the latest long-term support version |
| lts/<name> | Uses a specific long-term support version |
