#!/bin/bash

# exit when any command fails
set -e

new_ver=$1

echo "new version: $new_ver"

# Simulate release of the new docker images
#docker tag nginx:1.23.3 maheshgaikwad21/nginx:$new_ver

# Push new version to dockerhub
#docker push maheshgaikwad21/nginx:$new_ver

# Create temporary folder
tmp_dir=$(mktemp -d)  # Create a temporary directory
echo "Temporary directory: $tmp_dir"
#cd $tmp_dir
deploy_yaml_path="$tmp_dir/my-app/1-deployement.yaml"
# # Clone GitHub repo
git clone git@github.com:mahesh2121/ArgoCDProject.git $tmp_dir
# #echo $tmp_dir
# #echo $tmp_dircd 
echo $deploy_yaml_path
# # Update image tag
sed -i "s/maheshgaikwad21\/nginx:.*/maheshgaikwad21\/nginx:$new_ver/g" $deploy_yaml_path
echo "updated yaml file"
# sed -i "" -e "s/maheshgaikwad21\/nginx:.*/maheshgaikwad21\/nginx:$new_ver/g" $tmp_dir/my-app/1-deployement.yaml
 #sed -i '' -e "s/aputra\/nginx:.*/aputra\/nginx:$new_ver/g" $tmp_dir/my-app/1-deployment.yaml
#sed -i '' -e "s|maheshgaikwad21/nginx:.*|maheshgaikwad21/nginx:$new_ver|g" "$tmp_dir/ArgoCDProject/my-app/1-deployement.yaml"

# maheshgaikwad21/nginx

# # Commit and push
 cd $tmp_dir
 git add .
 git commit -m "Update image to $new_ver"
 git push

# # Optionally on build agents - remove folder
# #rm -rf $tmp_dir
