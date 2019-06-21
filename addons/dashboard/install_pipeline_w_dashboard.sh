#!/bin/sh
cd addons/dashboard
sed -e s/\<dashboard-host\>/$1/g dashboard.yaml > dashboard1.yaml
kubectl apply -f dashboard1.yaml
rm dashboard1.yaml
sed ':a;N;$!ba;s/resources:\n  - deployments\n  verbs:/resources:\n  - deployments\n  - ingresses\n  verbs:/g' ../../deploy/role.yaml > role.yaml
cat ../../deploy/service_account.yaml divider.txt role.yaml divider.txt ../../deploy/role_binding.yaml divider.txt ../../deploy/operator.yaml mount.txt > namespaced.yaml
rm role.yaml
cd -
kubectl apply  -f  addons/dashboard/namespaced.yaml
cd addons/dashboard
rm namespaced.yaml
cd -
