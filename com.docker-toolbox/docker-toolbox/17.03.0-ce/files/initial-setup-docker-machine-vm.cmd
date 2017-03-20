@echo off
call ./set-env.cmd

docker-machine create --driver virtualbox --virtualbox-boot2docker-url=https://github.com/boot2docker/boot2docker/releases/download/v1.13.1/boot2docker.iso --engine-insecure-registry 172.30.0.0/16 %DOCKER_TOOLBOX_DOCKER_MACHINE_VB_VMNAME%
 
call %SOFTWARE_DIR%\start-docker-machine.cmd
