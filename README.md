<div align="center">

  <img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg" width="100" height="100" alt="Ansible Logo">

  # 🚀 Ansible CI/CD Infrastructure Automation

  [![Ansible](https://img.shields.io/badge/Ansible-2.10+-ee0000?style=for-the-badge&logo=ansible&logoColor=white)](https://www.ansible.com/)
  [![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/features/actions)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

  **A professional, production-ready Ansible project with integrated GitHub Actions CI/CD pipeline.**

  [Overview](#-overview) • [Structure](#-directory-structure) • [CI/CD](#-cicd-workflow) • [Usage](#-getting-started) • [Contributing](#-contributing)

</div>

---

## 🎯 Project Overview

This repository provides a modular and scalable **Infrastructure as Code (IaC)** solution. It automates server provisioning, configuration management, and application deployment, ensuring consistency across all environments (Staging/Production).

### ✨ Key Features
- **Modular Roles:** Highly reusable Ansible roles for system hardening, web servers, and databases.
- **Automated Pipeline:** Integrated GitHub Actions for continuous quality checks.
- **Environment Isolation:** Clean separation between staging and production inventories.
- **Security Focused:** Pre-configured for Ansible Vault to keep your secrets safe.

---

## 📂 Directory Structure

A clean, standardized layout following Ansible best practices:

```bash
.
├── .github/workflows/    # CI/CD pipeline definitions (YAML)
├── inventories/          # Environment-specific host files
│   ├── staging.ini       # Staging environment hosts
│   └── production.ini    # Production environment hosts
├── group_vars/           # Variables shared across groups
├── roles/                # Reusable automation logic
│   ├── common/           # Base OS setup & security
│   ├── nginx/            # Web server configuration
│   └── db/               # Database management
├── playbooks/            # Main entry points
│   └── site.yml          # Master playbook
├── ansible.cfg           # Local Ansible configuration
└── README.md             # Documentation
🤖 CI/CD WorkflowThe project includes a robust GitHub Actions pipeline that triggers on every push and pull_request:StageDescriptionYAML LintValidates YAML syntax and formatting.Ansible LintChecks for best practices and potential errors.Syntax CheckRuns ansible-playbook --syntax-check to ensure code integrity.Dry Run(Optional) Executes a check-mode run against a test environment.🚀 Getting Started1️⃣ PrerequisitesAnsible: >= 2.10Python: 3.9+SSH Key: Configured access to target servers.2️⃣ InstallationBash# Clone the repository



# Install dependencies from Galaxy (if needed)
ansible-galaxy install -r requirements.yml
3️⃣ Running PlaybooksTo deploy to the Staging environment:Bashansible-playbook -i inventories/staging.ini playbooks/site.yml
🛡️ Security (Ansible Vault)Sensitive data is encrypted with Ansible Vault. To edit secret variables:Bashansible-vault edit group_vars/all/secrets.yml
Note: Ensure your ANSIBLE_VAULT_PASSWORD_FILE is configured or use --ask-vault-pass.🤝 ContributingContributions make the open-source community an amazing place!Fork the Project.Create your Feature Branch (git checkout -b feature/AmazingFeature).Commit your Changes (git commit -m 'Add AmazingFeature').Push to the Branch (git push origin feature/AmazingFeature).Open a Pull Request.