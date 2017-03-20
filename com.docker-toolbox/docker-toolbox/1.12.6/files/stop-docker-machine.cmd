@echo off
call ./set-env.cmd

docker-machine stop %DOCKER_TOOLBOX_DOCKER_MACHINE_VB_VMNAME%

