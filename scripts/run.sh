xhost +local:root

docker run -t -d \
  --net=host \
  --gpus all \
  --name arm_simulation
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  -v $(realpath ../workspace/src):/home/binil/ros2_ws/src \
  -v $(realpath ../workspace/env_setup.sh):/home/binil/env_setup.sh \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  --workdir=/home/binil/ros2_ws \
  --device=/dev/video0:/dev/video0 \
  --device=/dev/nvidia0 \
  --device=/dev/nvidiactl \
  --device=/dev/nvidia-uvm \
  --privileged \
  arm_simulation \

