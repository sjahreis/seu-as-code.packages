@echo off
call ./set-env.cmd

:: see: set-env-openshift.cmd for definition of environment variables used during this installation phase


echo "Setup docker-machine in VirtualBox %OC_DOCKER_VM_NAME% %OC_VIRTUALBOX_CPU_COUNT%#Cores %OC_VIRTUALBOX_MEMORY_SIZE%MB RAM %OC_VIRTUALBOX_DISK_SIZE%MB Harddisk"
docker-machine create --driver virtualbox --virtualbox-boot2docker-url=https://github.com/boot2docker/boot2docker/releases/download/v1.13.1/boot2docker.iso --engine-insecure-registry 172.30.0.0/16 --virtualbox-memory %OC_VIRTUALBOX_MEMORY_SIZE% --virtualbox-cpu-count %OC_VIRTUALBOX_CPU_COUNT% --virtualbox-disk-size %OC_VIRTUALBOX_DISK_SIZE% %OC_DOCKER_VM_NAME%

FOR /f "tokens=*" %%i IN ('docker-machine env %OC_DOCKER_VM_NAME%') DO @%%i


echo "Setup Openshift in VirtualBox %OC_DOCKER_VM_NAME%"
oc cluster up --docker-machine="%OC_DOCKER_VM_NAME%"