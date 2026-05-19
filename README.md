# Azure Platform IaC

Enterprise-style Infrastructure as Code platform focused on Azure, automation, CI/CD, monitoring, and reusable infrastructure design.

This repository contains Infrastructure as Code projects, automation tooling, and platform-related resources used to deploy and manage cloud infrastructure in a scalable and maintainable way.

---

# Overview

The goal of this repository is to provide a structured and reusable platform for deploying and managing Azure infrastructure using Infrastructure as Code principles.

The repository is designed around:

- Modular infrastructure
- Environment separation
- Reusable components
- CI/CD automation
- Monitoring and observability
- Security and compliance considerations
- Scalable project structure

The platform currently uses OpenTofu/Terraform for infrastructure provisioning, with plans to expand into additional IaC and platform tooling over time.

---

# Current Stack

## Cloud

- Azure

## Infrastructure as Code

- OpenTofu
- Terraform (compatible)

## CI/CD

- GitHub Actions

## Languages & Tooling

- Bash
- PowerShell
- Python
- Azure CLI

## Monitoring & Observability

- Azure Monitor
- Log Analytics
- Application Insights
- Alerting

---

# Repository Structure

```text
.
├── opentofu/                 # OpenTofu/Terraform infrastructure
├── docs/                     # Documentation and architecture diagrams
├── scripts/                  # Utility and automation scripts
├── .github/workflows/        # CI/CD pipelines
└── README.md
