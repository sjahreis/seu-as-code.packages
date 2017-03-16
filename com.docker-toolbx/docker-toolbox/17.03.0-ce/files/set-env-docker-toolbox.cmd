@echo off

:: Add Minishift and the OpenShift CLI to the path
set PATH=%SOFTWARE_DIR%\minishift-1.0.0-beta.4;%PATH%
set PATH=%HOME%\.minishift\cache\oc\v1.4.1;%PATH%

:: Correct the home variables which are used by Minishift
set USERPROFILE=%HOME%
set HOMEPATH=%HOME%
set HOMEDRIVE=%SEU_HOME%

:: Use VirtualBox for virtualization
set MINISHIFT_VM_DRIVER=virtualbox