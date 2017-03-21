@echo off

:: Correct the home variables which are used by docker-toolbox
set USERPROFILE=%HOME%
set HOMEPATH=%HOME%
set HOMEDRIVE=%SEU_HOME%

set APPDATA=%HOME%/AppData/Roaming

set MACHINE_STORAGE_PATH=%HOME%
set DOCKER_TOOLBOX_INSTALL_PATH=%SOFTWARE_DIR%/DockerToolbox-17.03.0-ce


::Defaults for new VirtualBox VM's
::https://docs.docker.com/machine/drivers/virtualbox/#usage
::--virtualbox-memory 	VIRTUALBOX_MEMORY_SIZE 	1024
::--virtualbox-cpu-count 	VIRTUALBOX_CPU_COUNT 	1
::--virtualbox-disk-size 	VIRTUALBOX_DISK_SIZE 	20000
set VIRTUALBOX_MEMORY_SIZE=2048
set VIRTUALBOX_CPU_COUNT=2
set VIRTUALBOX_DISK_SIZE=20000

set DOCKER_TOOLBOX_VIRTUAL_BOX_VM_NAME=defaultDockerSEU


FOR /f "tokens=*" %%i IN ('docker-machine env %DOCKER_TOOLBOX_VIRTUAL_BOX_VM_NAME%') DO @%%i
