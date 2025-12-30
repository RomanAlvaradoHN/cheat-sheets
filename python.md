# Simple Python Version Management

Go to [this link](https://github.com/pyenv/pyenv) to see the most recent instructions.

##  Installation Steps

1. Automatic installer (Recommended):  
`curl -fsSL https://pyenv.run | bash`

2. Add the environment variables:  
`echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc`  
`echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc`  
`echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc`  

3. Restart the shell:  
`source ~/.bashrc`



## PYENV COMMANDS

| Command                     | Meaning                                                             |
| :------                     | :------                                                             |
| `pyenv install [version]`   | Install a specific version of python                                |
| `pyenv install -l`          | Gives the list of all available versions                            |
| `pyenv shell [version]`     | Set python version just for current shell session                   |
| `pyenv local [version]`     | Set python version for the current directory and its subdirectories |
| `pyenv global [version]`    | Set python version for the user account (the preferred version)     |
| `pyenv uninstall [version]` | To remove an specific python version                                |

#### Note

Python versions are in `$(pyenv root)/versions` directory.

