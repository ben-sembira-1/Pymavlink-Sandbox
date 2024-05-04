ARG ARDUPILOT_TAG=Copter-4.5.1
# Just a regular docker build in ardupilot repo in tag Copter-4.5.1
FROM ardupilot:${ARDUPILOT_TAG}

RUN tmp_dir=$(mktemp -d temp_ardupilot_repo-XXX) && \
    git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git ${tmp_dir} && \
    sudo mv ${tmp_dir} /ardupilot-repo

WORKDIR /ardupilot-repo

RUN git checkout ${ARDUPILOT_TAG} && git submodule update

RUN ./waf configure --board sitl && ./waf copter

WORKDIR /pilot

ENTRYPOINT [ "/ardupilot_entrypoint.sh", "/ardupilot-repo/Tools/autotest/sim_vehicle.py" ]
