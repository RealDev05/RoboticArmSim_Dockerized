# A Dcokerized version of Robotic Arm Simulation of Team Horizon, CUSAT
This simulation uses the latest robotic arm of Horizon as per (23/04/2025). 
- ## Note : And since it uses Horizon Repositories, You may not be able to use this. Contact any of Team Horizon Member to get permission or alternative.
## Setup
- ### Clone the repo to your desired folder recursively
  ```shell
  git clone --recurse-submodules git@github.com:RealDev05/RoboticArmSim_Dockerized.git
  ```
  Note : If you accidentally did without recursive flag, run this
  ```shell
  git submodule update --init --recursive
  ```
- ### Build image
  ```shell
   cd RoboticArmSim_Dockerized
   sudo docker build -t arm_simulation .
  ```
## Run the docker container
```shell
cd scripts
./run.sh
```
## Open Terminal
Run the command 
```shell
./enter.sh
```
## Stop container
This is already happening when you run ```run.sh``` but if you need to stop it for some reason, then execute below
```shell
./stop.sh
```
