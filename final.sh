#!/bin/bash

# exit when any command fails
set -e

new_ver=$1

echo "new version: $new_ver"

# Create temporary folder
tmp_dir=$(mktemp -d)  # Create a temporary directory
echo "Temporary directory: $tmp_dir"

# Clone GitHub repo into the temporary directory
git clone git@github.com:mahesh2121/ArgoCDProject.git "$tmp_dir"

# Define the path to the deployment YAML file
deploy_yaml_path="$tmp_dir/my-app/1-deployement.yaml"
echo "Deployment YAML path: $deploy_yaml_path"

# Output the content of the YAML file
cat "$deploy_yaml_path"

# Update image tag in the deployment YAML file
sed -i "s/maheshgaikwad21/nginx:v0.1.2|maheshgaikwad21/nginx:$new_ver/g" $deploy_yaml_path

# Display the updated YAML content
cat "$deploy_yaml_path"

# Optionally, you can commit and push the changes here

# Optionally on build agents - remove folder
# rm -rf $tmp_dir
