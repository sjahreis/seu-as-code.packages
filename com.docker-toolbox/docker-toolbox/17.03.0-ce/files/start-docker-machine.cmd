@echo off
call ./set-env.cmd

docker-machine start %DOCKER_TOOLBOX_VIRTUAL_BOX_VM_NAME%

FOR /f "tokens=*" %%i IN ('docker-machine env %DOCKER_TOOLBOX_VIRTUAL_BOX_VM_NAME%') DO @%%i


