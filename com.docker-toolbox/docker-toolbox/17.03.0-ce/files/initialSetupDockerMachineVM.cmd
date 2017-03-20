@echo off
call ./set-env.cmd

docker-machine create --driver virtualbox %DOCKER_TOOLBOX_DOCKER_MACHINE_VB_VMNAME%
 
call %SOFTWARE_DIR%\start-docker-machine.cmd