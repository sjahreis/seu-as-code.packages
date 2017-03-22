# SEU-as-code Package for [Openshift v1.4.1](https://github.com/openshift/origin/releases/tag/v1.4.1)


The package contains Openshift Origin 1.4.1. 
This package requires the SEU package : com.docker-toolbox:docker-toolbox
Install this package using SEU-as-code with the following dependency:
```groovy
dependencies {
    software 'com.docker-toolbox:docker-toolbox:17.03.0-ce'
    software 'org.openshift:openshift:1.4.1'
}
```

### Requirements
Openshift Origin 1.4.1 requires the following SEU-packages:
 * [Docker-Toolbox 17.03.0-ce](https://github.com/docker/toolbox/releases/tag/v17.03.0-ce)

### SETUP
After you setup/updated your SEU, you have to manually execute the following command ONCE: 
```
S:\software\initial-setup-openshift-and-docker.cmd
```
Which will create and boot a new Docker VirtualBox image for OpenShift and install openshift into it.

After initial setup it should be enought to boot up the VM in Virtualbox to restore a work-ready state.


### BUG's
Openshift Origin < 1.5.x is incompatible with DockerTollbox versions > v1.13.1a
Eihter use a Openshift Origin < 1.5.x with a DockerToolbox version <= v1.13.1a
Or switch to an OpenShiftOrigin version >= 1.5.x

The install script S:\software\initialSetupOpenshiftAndDocker.cmd automatically selects and installs an appropirate version for you.
