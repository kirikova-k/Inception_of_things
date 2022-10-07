curl -sfL https://get.k3s.io | sh -s - server \
--write-kubeconfig-mode 0644 \
--node-ip "192.168.42.110" \
--flannel-iface eth1
cat /var/lib/rancher/k3s/server/node-token > /vagrant/token