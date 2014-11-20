# Repos
platform=$1
openstack=$2
openstackversion=$3

echo "===> Repos Snippet - $platform $openstack $openstackversion <==="

case $openstack in
  RDO|rdo)
    # EPEL
    yum list installed epel-release
    if [[ $? -ne 0 ]]
    then
      case $platform in
        rhel*|centos*)
          case $platform in
          *6)
            echo 'Adding EPEL6'
            yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
            ;;

          *7)
            echo 'Adding EPEL7'
            yum install -y http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
            ;;
        esac
        ;;
      esac
    fi

    yum list installed rdo-release-*
    if [[ $? -ne 0 ]]
    then
      case $openstackversion in
        4)
          echo 'Adding RDO Havana'
          yum -y install https://repos.fedorapeople.org/repos/openstack/openstack-havana/rdo-release-havana-9.noarch.rpm
          ;;

        5)
          echo 'Adding RDO Icehouse'
          yum -y install https://repos.fedorapeople.org/repos/openstack/openstack-icehouse/rdo-release-icehouse-4.noarch.rpm
          ;;

        6)
          echo 'Adding RDO Juno'
          yum -y install https://repos.fedorapeople.org/repos/openstack/openstack-juno/rdo-release-juno-1.noarch.rpm
          ;;
      esac
    fi
    ;;

  RHOS|rhos)
    echo "Adding RHOS"
    rpm -ivh http://team.virt.bos.redhat.com/repos/rhos-release/rhos-release-latest.noarch.rpm
    rhos-release $openstackversion
    ;;
  *)
    echo "Error: no Repos assigned"
    exit 1
    ;;
esac

yum -y update
