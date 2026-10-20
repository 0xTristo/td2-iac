# TD2 IaC — K3s industrialisé avec Terraform, Ansible et Helm

Auteur : Ali Terro

- `terraform/` : groupe de sécurité, VM, IP flottante (data sources pour l'image, le flavor, `asl-net`, le réseau public et la keypair).
- `ansible/` : rôles `k3s-prereq`, `k3s` et `kubeconfig`, inventaire généré depuis `terraform output`, tunnel SSH vers l'API (port 6443 fermé dans le groupe de sécurité).
- `helm/` : charts `postgres` (StatefulSet + PVC), `backend` (Deployment, 2 réplicas) et `frontend` (nginx, Ingress traefik, en-tête `X-Pod-Name`).

Fichiers exclus du dépôt : `terraform.tfstate*`, `terraform.tfvars`, `ansible/inventory.ini`, `ansible/kubeconfig`.
Copier `terraform/terraform.tfvars.example` en `terraform/terraform.tfvars` et renseigner son login.
