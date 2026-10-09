#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USER="$1"
PRINT_MODE="${2:-text}"

clear
echo "=================================================================="
echo "IAM_SUMMARY_FOR_USER:_$USER"
echo "=================================================================="
echo -e "\n"
echo "------------------------------------------------------------------"
echo "GROUPS"
echo "------------------------------------------------------------------"
aws iam list-groups-for-user --output "$PRINT_MODE" --user-name "$USER" --query "Groups[*].{GroupName:GroupName, Arn:Arn"}
  

echo -e "\n"
echo "------------------------------------------------------------------"
echo "CUSTOM_POLICIES_(Customer_Managed_Directly_attached_&_Inline)"
echo "------------------------------------------------------------------"
# Customer Managed attached to user
aws iam list-attached-user-policies --output "$PRINT_MODE"  --user-name "$USER" \
  --query "AttachedPolicies[?!contains(PolicyArn, 'arn:aws:iam::aws:policy/')].{PolicyName:PolicyName, PolicyArn:PolicyArn}"
  
# Inline policies embedded in user
aws iam list-user-policies --output "$PRINT_MODE" --user-name "$USER" \
  --query "PolicyNames[*].{PolicyName:@, PolicyArn:\`Inline-Policy                                   \`}"



echo -e "\n"
echo "------------------------------------------------------------------"
echo "AWS_MANAGED_POLICIES_(Directly_attached)"
echo "------------------------------------------------------------------"
aws iam list-attached-user-policies --output "$PRINT_MODE" --user-name "$USER" \
  --query "AttachedPolicies[?contains(PolicyArn, 'arn:aws:iam::aws:policy/')].{PolicyName:PolicyName, PolicyArn:PolicyArn}"

echo -e "\n"