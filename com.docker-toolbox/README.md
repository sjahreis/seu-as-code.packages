# SEU-as-code Packages for [Docker-Toolbox](https://www.docker.com/products/docker-toolbox)
---
Once installed this package might interfere with Docker-Toolbox installations allready present or installed in the future, even if the containing SEU is unmounted or deleted.
Consider executing the Docker-Toolbox uninstaller before discarding the SEU
---

Contains the individual Gradle build projects for docker-toolbox for windows (runs docker inside VirtualBox - NOT Hypver-V).
This package "violates" the default SEU Packge behaviour, as there is no .zip version of docker-toolbox but just a rather intrusive and big installer.exe. 
This package does not publish the docker-toolbox binary/installer files into the nexus.
It just contains an download&install groovy script in META-INF/hooks, which will run during gradle tasks bootstrapSeu or updateSeu.

!The docker-toolbox installer taints the windows registry!
 * HKEY_CURRENT_USER\Environment
  * DOCKER_TOOLBOX_INSTALL_PATH
  * PATH

Deleting this package or SEU will not remove these fragments.

