#!/bin/sh
cd addons/dashboard
kubectl apply -f dashboard.yaml
cat ../../deploy/service_account.yaml divider.txt ../../deploy/role.yaml divider.txt ../../deploy/role_binding.yaml divider.txt ../../deploy/operator.yaml mount.txt > namespaced.yaml
cd -
kubectl apply  -f  addons/dashboard/namespaced.yaml
cd addons/dashboard
rm namespaced.yaml
cd -
