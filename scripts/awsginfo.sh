#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 <group_name> [output_format]"
  exit 1
fi

GROUP="$1"
PRINT_MODE="${2:-text}"

clear
echo "=================================================================="
echo "IAM_SUMMARY_FOR_GROUP:_$GROUP"
echo "=================================================================="

echo -e "\n"
echo "------------------------------------------------------------------"
echo "CUSTOM_POLICIES_(Customer_Managed_Directly_attached_&_Inline)"
echo "------------------------------------------------------------------"
# Customer Managed attached to group
aws iam list-attached-group-policies --output "$PRINT_MODE" --group-name "$GROUP" \
  --query "AttachedPolicies[?!contains(PolicyArn, 'arn:aws:iam::aws:policy/')].{PolicyName:PolicyName, PolicyArn:PolicyArn}"

# Inline policies embedded in user
aws iam list-group-policies --output "$PRINT_MODE" --group-name "$GROUP" \
  --query "PolicyNames[*].{PolicyName:@, PolicyArn:\`Inline-Policy                                   \`}"


echo -e "\n"
echo "------------------------------------------------------------------"
echo "AWS_MANAGED_POLICIES_(Directly_attached)"
echo "------------------------------------------------------------------"
# AWS Managed attached to group
aws iam list-attached-group-policies --output "$PRINT_MODE" --group-name "$GROUP" \
  --query "AttachedPolicies[?contains(PolicyArn, 'arn:aws:iam::aws:policy/')].{PolicyName:PolicyName, PolicyArn:PolicyArn}"

echo -e "\n"