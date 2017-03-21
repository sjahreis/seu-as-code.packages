@echo off
call ./set-env.cmd

docker-machine stop %DOCKER_TOOLBOX_VIRTUAL_BOX_VM_NAME%

