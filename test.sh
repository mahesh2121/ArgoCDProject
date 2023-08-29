#!/bin/bash

# ...
tmp_dir=$(mktemp -d)  # Create a temporary directory
echo "Temporary directory: $tmp_dir"

# Clone GitHub repo
git clone git@github.com:mahesh2121/ArgoCDProject.git "$tmp_dir"

# Find the desired YAML file
deploy_yaml_path=$(find "$tmp_dir" -name "1-deployement.yaml" -type f -print)

if [ -z "$deploy_yaml_path" ]; then
  echo "No deployment YAML file found!"
  exit 1
fi

echo $deploy_yaml_path

cat $tmp_dir/my-app/1-deployement.yaml

# Update image tag in the found YAML file
#sed -i '' -e "s|maheshgaikwad21/nginx:.*|maheshgaikwad21/nginx:$new_ver|g" "$deploy_yaml_path"

# ...

