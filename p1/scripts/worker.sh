curl -sfL https://get.k3s.io | sh -s - agent \
--server "https://192.168.42.110:6443" \
--node-ip "192.168.42.111" \
--flannel-iface eth1 \
--token-file /vagrant/token