# Quickstack
quickstack=$1
quickstackbranch=$2
echo 'Quickstack Snippet'

cat > /usr/local/bin/quickstack.sh <<EOF
#!/bin/bash

cd /usr/share
rm -rf openstack-foreman-installer
git clone https://github.com/gildub/astapor.git openstack-foreman-installer
cd openstack-foreman-installer
git checkout $quickstackbranch
EOF
chmod +x /usr/local/bin/quickstack.sh

case $quickstack in
  rpm)
    echo 'Quickstack from RPM'
    # In the future, once quickstack is available as a standalone module, this could be done directly:
    # yum -y install openstack-foreman-installer
    # But in the meantime, we have to pull it directly from Foreman repo (RHEL-6-Server-OS-Foreman)
    rpm -e openstack-foreman-installer
    rpm -ivh --nodeps http://download.lab.bos.redhat.com/rel-eng/OpenStack/Foreman/latest/RHEL-6-Server-OS-Foreman/x86_64/os/Packages/openstack-foreman-installer-2.0.32-1.el6ost.noarch.rpm
    ;;
  *)
    echo "Quickstack from GIT $quickstack branch $quickstackbranch"
    yum -y install git
    cd /usr/share
    if [[ -d openstack-foreman-installer ]]
    then
      rm -rf openstack-foreman-installer
    fi
    git clone $quickstack openstack-foreman-installer
    cd openstack-foreman-installer
    git checkout $quickstackbranch
    ;;
esac
