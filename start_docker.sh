# Define container firmware root
CONTAINER_FIRMWARE_ROOT="/src/PX4"

# Detect host architecture
ARCH=$(uname -m)

# Set host firmware root based on architecture
if [ "$ARCH" = "arm64" ]; then
    HOST_FIRMWARE_ROOT="~/Workspace/Nearthlab/PX4"
else
    HOST_FIRMWARE_ROOT="~/Workspace/PX4"
fi

docker run -it --rm \
    --volume=~/Workspace/Nearthlab/PX4:$CONTAINER_FIRMWARE_ROOT:rw \
    --env=FIRMWARE=$CONTAINER_FIRMWARE_ROOT/PX4-Autopilot \
    --name=px4_build_docker \
    vividlibra/focal-px4-nuttx:latest /bin/bash
