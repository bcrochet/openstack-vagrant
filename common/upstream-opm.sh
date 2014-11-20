mkdir -p /usr/share/openstack-puppet/modules
cd /usr/share/openstack-puppet/modules

git clone https://github.com/puppetlabs/puppetlabs-stdlib.git stdlib
git clone https://github.com/puppetlabs/puppetlabs-mysql.git mysql
git clone https://github.com/puppetlabs/puppetlabs-rabbitmq.git rabbitmq
git clone https://github.com/puppetlabs/puppetlabs-inifile.git inifile
git clone https://github.com/stackforge/puppet-openstack.git openstack
git clone https://github.com/stackforge/puppet-vswitch.git vswitch

git clone https://github.com/stackforge/puppet-nova.git nova
cd nova
git checkout stable/icehouse
cd ..

git clone https://github.com/stackforge/puppet-keystone.git keystone
cd keystone
git checkout stable/icehouse
cd ..

git clone https://github.com/stackforge/puppet-glance.git glance
cd glance
git checkout stable/icehouse
cd ..

git clone https://github.com/stackforge/puppet-neutron.git neutron
cd neutron
git checkout stable/icehouse
cd ..

git clone https://github.com/stackforge/puppet-cinder.git cinder
cd cinder
git checkout stable/icehouse
cd ..

git clone https://github.com/nanliu/puppet-staging.git staging
