# SEU-as-code Packages for [Docker-Toolbox](https://www.docker.com/products/docker-toolbox)
---
Once installed this package might interfere with Docker-Toolbox installations allready present or installed in the future, even if the containing SEU is unmounted or deleted.
Consider executing the Docker-Toolbox uninstaller before discarding the SEU
---

The package contains Docker-Toolbox 17.03.0-ce for Windows. 
Install this package using SEU-as-code with the following dependency:
```groovy
dependencies {
		    software 'com.docker-toolbox:docker-toolbox:17.03.0-ce'
}
```

Contains the individual Gradle build projects for Docker-Toolbox for windows (runs docker inside VirtualBox - NOT Hypver-V).
This package "violates" the default SEU Packge behaviour, as there is no .zip version of docker-toolbox but just a installer .exe wich is rather big and intrusive into the system.
Therefore this package does not! publish the docker-toolbox binary/installer files into the nexus within in the generated .jar. 
Instead it just contains an download&install groovy script in META-INF/hooks, which will run during gradle tasks bootstrapSeu or updateSeu.
This hook skript will download and install Docker-Toolbox fresh from a online server.
---

!The docker-toolbox installer taints the windows registry!
 * HKEY_CURRENT_USER\Environment
  * DOCKER_TOOLBOX_INSTALL_PATH
  * PATH

Deleting this package or SEU will not remove these fragments.

