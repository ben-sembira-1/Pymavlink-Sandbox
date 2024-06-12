#!/bin/bash
set -euo pipefail

pushd `dirname $0`
trap 'popd' EXIT

is_repo_clean=`git status --porcelain`

if [[ $is_repo_clean ]]; then
  echo Repo is not clean
  exit 1
else
  :
fi

read -p "Tag: " newtag_number
PROJECT_NAME=`basename "$(pwd)"`
project_name_with_dashes=`echo "$PROJECT_NAME" | tr " " "-"`
newtag="$project_name_with_dashes"-$newtag_number

git push
git tag $newtag
git push --tags

rm -rf dist
python3 -m pip install --upgrade build
python3 -m build
python3 -m twine upload dist/*

echo "Succesfully uploaded the package in version ${newtag}"
