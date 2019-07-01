#!/bin/sh
cd addons/webhook
kubectl apply -f webhook.yaml
cat ../../deploy/service_account.yaml divider.txt ../../deploy/role.yaml additionalrole.txt divider.txt ../../deploy/role_binding.yaml divider.txt ../../deploy/operator.yaml mount.txt > namespaced.yaml
cd -
kubectl apply  -f  addons/webhook/namespaced.yaml
cd addons/webhook
rm namespaced.yaml
cd -
