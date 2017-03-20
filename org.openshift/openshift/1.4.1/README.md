# SEU-as-code Packages for [Openshift](https://www.openshift.org/)
=====

The package contains Openshift Origin 1.4.1. 
Install this package using SEU-as-code with the following dependency:
```groovy
dependencies {
		software 'org.openshift:openshift:1.4.1'
}
```

### BUG's
Openshift Origin < 1.5.x is incompatible with DockerTollbox versions > v1.13.1a
Eihter use a Openshift Origin < 1.5.x with a DockerToolbox version <= v1.13.1a
Or switch to an OpenShiftOrigin version >= 1.5.x