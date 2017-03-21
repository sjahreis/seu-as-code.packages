@echo off

:: Add OpenShift CLI to the path
set PATH=%SOFTWARE_DIR%\openshift-1.4.1;%PATH%


::Defaults for new VirtualBox VM's
::https://docs.docker.com/machine/drivers/virtualbox/#usage
::--virtualbox-memory 	VIRTUALBOX_MEMORY_SIZE 	1024
::--virtualbox-cpu-count 	VIRTUALBOX_CPU_COUNT 	1
::--virtualbox-disk-size 	VIRTUALBOX_DISK_SIZE 	20000
:: prepend OC_ for openshift 
set OC_VIRTUALBOX_MEMORY_SIZE=2048
set OC_VIRTUALBOX_CPU_COUNT=2
set OC_VIRTUALBOX_DISK_SIZE=20000

set OC_DOCKER_VM_NAME=openshiftSEU


FOR /f "tokens=*" %%i IN ('docker-machine env %OC_DOCKER_VM_NAME%') DO @%%i
