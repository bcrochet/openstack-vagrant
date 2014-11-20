# OPM
# If not 'rpm' then value is branch
opm=$1
opmbranch=$2

case $opm in
  rpm)
    echo 'OPM from RPM'
    yum -y install openstack-puppet-modules
    ;;
  *)
    echo "OPM from $opm branch $opmbranch"
    yum -y install git
    cd /usr/share
    if [[ -d openstack-puppet ]]
    then
      rm -rf openstack-puppet
    fi
    mkdir -p openstack-puppet
    cd openstack-puppet
    git clone $opm modules
    cd modules
    git checkout $opmbranch
    git submodule init
    git submodule update
    ;;
esac
