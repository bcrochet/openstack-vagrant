# OpenStack masterless install
classes="hiera_include('$1')"

echo "Openstack Masterless setup"

yum -y install puppet

ln -sf /etc/hiera.yaml /etc/puppet/hiera.yaml

cp /usr/share/openstack-foreman-installer/puppet/modules/quickstack/data/classes.yaml /var/lib/hiera/defaults.yaml

# TEMP
setenforce 0

# Install
echo "puppet apply -e \"$classes\" --modulepath=/usr/share/openstack-puppet/modules:/usr/share/openstack-foreman-installer/puppet/modules"
#puppet apply -e "$classes" --modulepath=/usr/share/openstack-puppet/modules:/usr/share/openstack-foreman-installer/puppet/modules
