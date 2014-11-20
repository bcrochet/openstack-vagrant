# Temp fix
echo "Replacing concat with upstream/master"
if [[ ! -d  /root/concat-rpm ]]
then
  mv /usr/share/openstack-puppet/modules/concat /root/concat-rpm
  git clone https://github.com/puppetlabs/puppetlabs-concat.git /usr/share/openstack-puppet/modules/concat
fi
