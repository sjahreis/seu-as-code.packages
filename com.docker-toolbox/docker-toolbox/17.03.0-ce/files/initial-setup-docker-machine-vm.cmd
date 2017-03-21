@echo off
call ./set-env.cmd

:: see: set-env-docker-toolbox.cmd for environment variables used during setup

::for additional docker options either add to line below or add to DOCKER_OPTS env variable
docker-machine create --driver virtualbox %DOCKER_TOOLBOX_VIRTUAL_BOX_VM_NAME%
 
call %SOFTWARE_DIR%\start-docker-machine.cmd
