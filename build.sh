#!/bin/bash

if [ -z "$1" ]; then
  echo "Please supply a project name"
  exit 1
fi

# Capture the project name
project="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"
uproject=$(echo $project | tr [a-z] [A-Z])
echo "Creating project: ${project} with env of ${uproject}"

# Delete the .git dir
rm -rf .git/ .bundle/ vendor/
LC_ALL=C find . -type f -not -path "./vendor" -not -path "./build.sh" -not -path "./.bundle/" -exec sed -i '' "s/::PROJECTNAME::/${project}/g" {} \;
LC_ALL=C find . -type f -not -path "./vendor" -not -path "./build.sh" -not -path "./.bundle/" -exec sed -i '' "s/::UPPERNAME::/${uproject}/g" {} \;

# Create git remote
git init
git add .
git commit -m "Imported Zepnik Framework"
