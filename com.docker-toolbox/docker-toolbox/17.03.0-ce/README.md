# SEU-as-code Package for [Docker-Toolbox 17.03.0-ce](https://github.com/docker/toolbox/releases/tag/v17.03.0-ce)

Once installed this package might interfere with Docker-Toolbox installations allready present or installed in the future, even if the containing SEU is unmounted or deleted.
Consider executing the Docker-Toolbox uninstaller before discarding the SEU.


The package contains Docker-Toolbox 17.03.0-ce for Windows. 
Install this package using SEU-as-code with the following dependency:
```groovy
dependencies {
    software 'com.docker-toolbox:docker-toolbox:17.03.0-ce'
}
```

### Contents
This Docker-Toolbox version contains the following software:
* docker 17.03.0-ce
* docker-machine 0.10.0
* docker-compose 1.11.2
* Kitematic 0.13.1
* Boot2Docker ISO 17.03.0-ce
* VirtualBox 5.1.14

### Requirements
Docker-Toolbox requires the following tools to be installed:
 * VirtualBox
 * Git
 
If not installed, you can enable the according checkboxes during the installation of Docker-Toolbox.
Why not enabled by default: docker-toolbox's detection of VirtualBox is rudimentary and it would overwrite an existing VirtualBox version.



### Warning
!The docker-toolbox installer taints the windows registry
  * HKEY_CURRENT_USER\Environment
    * DOCKER_TOOLBOX_INSTALL_PATH
    
and your ENV:
  * DOCKER_TOOLBOX_INSTALL_PATH
  * PATH

Deleting this package or SEU will not remove these fragments.

###  Disclaimer
Contains the individual Gradle build projects for Docker-Toolbox for windows (runs docker inside VirtualBox - NOT Hypver-V).
This package "violates" the default SEU Packge behaviour, as there is no .zip version of docker-toolbox but just a installer .exe wich is rather big and intrusive into the system.
Therefore this package does not! publish the docker-toolbox binary/installer files into the nexus within in the generated .jar. 
Instead it just contains an download&install groovy script in META-INF/hooks, which will run during gradle tasks bootstrapSeu or updateSeu.
This hook skript will download and install Docker-Toolbox fresh from an online server.
