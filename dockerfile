FROM ros:humble-ros-core-jammy

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=humble

# Set up Gazebo Harmonic key and source
RUN apt-get update && apt-get install -y curl gnupg lsb-release \
 && curl -sSL https://packages.osrfoundation.org/gazebo.gpg -o /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" > /etc/apt/sources.list.d/gazebo-stable.list

# Install ROS 2 & Gazebo dependencies
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-rviz2 \
    gz-harmonic \
    ros-${ROS_DISTRO}-ros-gzharmonic \
    python3-colcon-common-extensions \
    build-essential \
    git \
    curl \
    wget \
    nano \
    gnupg \
    bash-completion \
    x11-xserver-utils \
    locales \
    libqt5core5a libqt5gui5 libqt5widgets5 libqt5x11extras5 \
 && rm -rf /var/lib/apt/lists/*

# Create a user named binil and set up home directory
RUN useradd -ms /bin/bash binil \
 && echo "binil:1234" | chpasswd \
 && usermod -aG sudo binil

# Grant sudo privileges without password prompt
RUN echo "binil ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/10-binil-nopasswd

# Locale setup
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Auto-source ROS and your env setup file
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/binil/.bashrc \
 && echo "source /home/binil/env_setup.sh" >> /home/binil/.bashrc

# Change user to binil
USER binil
WORKDIR /home/binil

# Set default shell
SHELL ["/bin/bash", "-c"]
CMD ["bash"]

