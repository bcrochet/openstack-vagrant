openstack-vagrant
=================
Vagrant environment for OpenStack

## Setup
A test set is controlled using environment variables as described in
lib/helpers.rb.

For instance (those are the default values):  
```
export PLATFORM=rhel7  
export OPENSTACK=rhos  
export OPENSTACK_VERSION=5
export OPM=rpm  
export QUICKSTACK=rpm
```

* To use git instead of rpm simply provide the source repo path:  
For instance for OPM:  
`export OPM=https://github.com/redhat-openstack/openstack-puppet-modules.git`  
or for Quickstack  
`export QUICKSTACK=https://github.com/redhat-openstack/astapor.git`

* The default branch is always master meanwhile a specific branch can be specified:  
`export OPM_BRANCH='<branch-name>'`  
or  
`export QUICKSTACK_BRANCH='<branch-name>'`  

## RUN
To run a test set, for instance the HA one:  
```
cd HA  
vagrant up
``` 
## Notes
For Vagrant libvirt(kvm) provider:
```
export VAGRANT_DEFAULT_PROVIDER=libvirt
```

