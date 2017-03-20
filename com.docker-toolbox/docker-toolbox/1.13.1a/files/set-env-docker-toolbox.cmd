@echo off

:: Correct the home variables which are used by docker-toolbox
set USERPROFILE=%HOME%
set HOMEPATH=%HOME%
set HOMEDRIVE=%SEU_HOME%

set APPDATA=%HOME%/AppData/Roaming

set MACHINE_STORAGE_PATH=%HOME%
set DOCKER_TOOLBOX_INSTALL_PATH=%SOFTWARE_DIR%/DockerToolbox-1.13.1a
set DOCKER_TOOLBOX_DOCKER_MACHINE_VB_VMNAME=defaultSEUDocker

FOR /f "tokens=*" %%i IN ('docker-machine env %DOCKER_TOOLBOX_DOCKER_MACHINE_VB_VMNAME%') DO @%%i


