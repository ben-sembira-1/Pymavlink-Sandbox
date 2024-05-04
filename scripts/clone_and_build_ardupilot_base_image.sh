#!/bin/bash
set -euo pipefail
ARDUPILOT_TAG="Copter-4.5.1"
tmp_dir=$(mktemp -d temp_ardupilot_repo-XXX)
git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git ${tmp_dir}
pushd ${tmp_dir}
git checkout ${ARDUPILOT_TAG}
docker build -t ardupilot:${ARDUPILOT_TAG} .
popd
sudo rm -r ${tmp_dir}
