@echo off
call ./set-env.cmd

docker-machine start %DOCKER_TOOLBOX_DOCKER_MACHINE_VB_VMNAME%

FOR /f "tokens=*" %%i IN ('docker-machine env %DOCKER_TOOLBOX_DOCKER_MACHINE_VB_VMNAME%') DO @%%i


