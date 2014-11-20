# Hiera Defaults
echo "===> Creating hiera top level defaults <==="
cat > /usr/share/openstack-foreman-installer/puppet/modules/quickstack/data/custom.yaml <<EOF
---
network_admin: '$1'
network_internal: '$2'
network_public: '$3'
EOF
