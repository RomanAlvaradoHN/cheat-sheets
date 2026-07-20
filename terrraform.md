# Terraform Version Manager

Go to [this link](https://github.com/tfutils/tfenv) to see the most recent instructions.

##  Installation Steps

1. Clone the repository:  
    ```bash
    git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
    ```

2. Add the environment variables and aliases:  
    ```bash
    echo -e "\n\n" >> ~/.bashrc
    echo '#terraform configs ====================================' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/.tfenv/bin"' >> ~/.bashrc
    ```

3. Restart the shell:  
    ```bash
    source ~/.bashrc
    ```

4. Verify the installation:  
    ```bash
    tfenv --version
    ```


## TFENV COMMANDS (`tfenv --help`)

| Command                     | Meaning                                             |
| :------                     | :------                                             |
| `tfenv install [version]`   | Install a specific version of Terraform             |
| `tfenv use [version]`       | Switch a version to use                             |
| `tfenv uninstall [version]` | To uninstall a specific version                     |
| `tfenv list`                | To list installed versions                          |
| `tfenv list-remote`         | To list installable versions                        |
| `tfenv version-name`        | Print current version                               |
| `tfenv init`                | Update environment to use tfenv correctly           |
| `tfenv pin`                 | Write active current version to./.terraform-version |



#### Parameters options:
| Parameter      | Meaning                                                                 |
| :-----------   | :------                                                                 |
| x.y.z          | String specifying the exact version to install                          |
| latest         | Install the latest version                                              |
| latest-allowed | Scan your Terraform files to detect which version is maximally allowed  |
| min-required   | Scan your Terraform files to detect which version is minimally required |
| latest:<regex> | Install latest version matching regex (used by grep -e)                 |


#### Note
If no parameter is passed, the version to use is resolved automatically via:  
1. **TFENV_TERRAFORM_VERSION** environment variable.
2. **.terraform-version** file.  

The default is '**latest**' if none are found.

___



# TERRAFORM COMMANDS

| Command             | Meaning                                                                                  |
| :------             | :------                                                                                  |
| terraform plan      | To validate what actions we are going to perform                                         |
| terraform apply     | To applicate changes                                                                     |
| terraform destroy   | To destroy a service or resource                                                         |
| terraform import    | To import as a terraform file an amazon resource                                         |
| terraform fmt       | Tries to give standart terraform format                                                  |
| terraform validate  | Checks that your configuration is syntactically valid and internally consistent          |
| terraform taint     | Mark a resource, so in the next plan, it will be replaced                                |
| terraform state rm  | Removes a resource from your the state file without destroying the actual infrastructure |



# TERRAFORM BASH ALIASES

```bash
#Terraform aliases ===============================
alias tf='terraform'
alias tfplan="clear && echo 'Terraform Plan' > tfplan.txt && terraform plan | tee -a tfplan.txt"

alias catplan="clear && cat tfplan.txt"
alias catplan-ls="clear && cat tfplan.txt | grep -v 'will be read' | grep '# module.'"
alias catplan-c="clear && cat tfplan.txt | grep '# module.' | grep 'will be created'"
alias catplan-u="clear && cat tfplan.txt | grep '# module.' | grep 'will be updated'"
alias catplan-d="clear && cat tfplan.txt | grep '# module.' | grep 'destroyed'"
alias catplan-rep="clear && cat tfplan.txt | grep '# module.' | grep 'replaced'"
alias catplan-r="clear && cat tfplan.txt | grep '# module.' | grep 'will be read'"

alias tfss="clear && terraform state show"
```