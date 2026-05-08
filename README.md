<div align="center">

  <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Terraform_Logo.svg" width="90" height="90" alt="Terraform Logo" style="margin-right: 20px;">
  <img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg" width="90" height="90" alt="Ansible Logo">

  # 🚀 Faz6-IaC Infrastructure Automation

  [![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
  [![Ansible](https://img.shields.io/badge/Ansible-2.10+-ee0000?style=for-the-badge&logo=ansible&logoColor=white)](https://www.ansible.com/)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

  **A complete Infrastructure as Code (IaC) solution combining Terraform for provisioning and Ansible for configuration management.**

  [Overview](#-overview) • [Structure](#-directory-structure) • [Usage](#-getting-started) • [Security](#️-security) • [Contributing](#-contributing)

</div>

---

## 🎯 Project Overview

This repository (`faz6-iac`) provides an end-to-end automated deployment pipeline. It uses **Terraform** to provision the underlying network and compute resources, and **Ansible** to configure those resources, deploy services (like Docker and Nginx), and manage secrets.

### ✨ Key Features
- **Infrastructure Provisioning:** Modular Terraform architecture separating `compute` and `network` components.
- **Configuration Management:** Focused Ansible playbooks for web clusters, Nginx setups, and Docker installations.
- **Secret Management:** Integrated Ansible Vault for secure credential handling.
- **Automation Scripts:** Included bash scripts (`deploy-all.sh`) for streamlined, one-click deployments.

---

## 📂 Directory Structure

The project is structured to strictly separate provisioning (Terraform) from configuration (Ansible):

```bash
.
├── ana_vm_key.pub            # Public SSH key for VM access
├── ansible/                  # Configuration Management
│   ├── inventory.ini         # Target host definitions
│   ├── playbooks/            # Execution playbooks (Docker, Nginx, Cluster)
│   ├── templates/            # Jinja2 configuration templates (e.g., nginx.conf.j2)
│   └── vault/                # Encrypted secrets (secrets.yml)
├── scripts/                  # Automation helpers
│   └── deploy-all.sh         # Master deployment script
└── terraform/                # Infrastructure Provisioning
    ├── provider.tf           # Cloud provider configurations
    ├── main.tf               # Root module executions
    ├── outputs.tf            # State outputs
    └── modules/              # Reusable Terraform infrastructure modules
        ├── compute/          # Virtual Machine/EC2 definitions
        └── network/          # VPC, Subnets, and Security Groups


(Note: State files and deleted backup configurations are intentionally omitted from version control tracking.)

🚀 Getting Started
1️⃣ Prerequisites
Terraform: >= 1.0.0

Ansible: >= 2.10

Cloud Credentials: Ensure your provider credentials (e.g., AWS, GCP, etc.) are configured in your environment.

2️⃣ Provisioning Infrastructure (Terraform)
First, spin up the required cloud resources.


# Navigate to the terraform directory
cd terraform

# Initialize providers and modules
terraform init

# Review the planned changes
terraform plan

# Apply the infrastructure build
terraform apply -auto-approve



3️⃣ Configuring Servers (Ansible)
Once the infrastructure is up and running, configure the servers.


# Navigate to the ansible directory
cd ../ansible

# Example: Install Docker on the targets
ansible-playbook -i inventory.ini playbooks/install_docker.yml

# Example: Deploy the full web cluster
ansible-playbook -i inventory.ini playbooks/deploy_web_cluster.yml



4️⃣ One-Click Deployment
Alternatively, you can use the provided script to deploy everything at once:

chmod +x scripts/deploy-all.sh
./scripts/deploy-all.sh

🛡️ Security (Ansible Vault)
Sensitive data and credentials are kept in ansible/vault/secrets.yml. This file is encrypted using Ansible Vault.

To edit the secrets file:

Bash
cd ansible
ansible-vault edit vault/secrets.yml


To run a playbook that requires vault decryption:

Bash
ansible-playbook -i inventory.ini playbooks/test_vault.yml --ask-vault-pass





🤝 Contributing
Contributions make the open-source community an amazing place!

Fork the Project.

Create your Feature Branch (git checkout -b feature/AmazingFeature).

Commit your Changes (git commit -m 'Add AmazingFeature').

Push to the Branch (git push origin feature/AmazingFeature).

Open a Pull Request.