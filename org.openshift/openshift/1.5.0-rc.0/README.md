# SEU-as-code Packages for [Openshift](https://www.openshift.org/)
=====

The package contains Openshift Origin 1.5.0-rc.0
Install this package using SEU-as-code with the following dependency:
```groovy
dependencies {
		software 'org.openshift:openshift:1.5.0-rc.0'
}
```

### BUG's

Openshift Origin version  < 1.5.x are incompatible with DockerTollbox server versions > v1.13.1a (semantic versioning naming bug: "minor version beginns with 0")
