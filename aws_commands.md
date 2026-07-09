# AWS - DEBUG COMMANDS

## Enter to an ECS Container

Go to [this link](https://towardsthecloud.com/blog/amazon-ecs-execute-command-access-container) to see official documentation.

1. Validate the task has the execute_command enabled
    ```bash
    aws ecs describe-tasks --cluster test-prosper-ecs001 --tasks 73b62e23979f423bba59a0f809aa4c9e
    ```

2. Enter to the Container
    ```bash
    aws ecs execute-command --cluster test-prosper-ecs001 \
    --task 1520cb5cb165410dab163f9f8eeadccc \
    --container test-fhirfacade  \
    --interactive \
    --command "/bin/sh" \
    --region us-west-1
    ```


## Get Secrets
```bash
 aws secretsmanager get-secret-value \
--secret-id ${{ inputs.environment }}/${{ inputs.app-name }} \
--query SecretString \
--output text | jq -r 'to_entries | .[] | "\(.key)=\(.value)"' \
> ${{ inputs.app-name }}.env
```