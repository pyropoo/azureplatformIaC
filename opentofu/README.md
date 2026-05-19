# OpenTofu Infrastructure – Azure Secret Expiry Monitor

## Overview

This directory contains the **Infrastructure as Code (IaC)** for deploying the Azure Secret Expiry Monitor using OpenTofu.

The infrastructure is designed to be:

- **Minimal** – only required Azure resources
- **Cost-efficient** – serverless and consumption-based
- **Stateless** – no persistent data storage
- **Modular** – reusable components via modules

---

## Architecture Design

### Hosting

- Platform: **Azure Functions**
- Runtime: **Python**
- Hosting Tier: **Flex Consumption (preferred)**

Reason:

- Lowest cost for low-frequency workloads
- Automatically scales
- No always-on infrastructure

---

### Application Model

- Stateless execution
- Runs on a **schedule (timer-triggered)**
- No database or persistent state
- All data fetched at runtime from Microsoft Graph

---

### Core Resources

The infrastructure consists of only the following components:

#### Resource Group

- Logical container for all resources

#### Storage Account

- Required for Azure Function runtime
- No application data stored

#### Function App

- Hosts the Python application
- Uses **system-assigned managed identity**

#### Application Insights

- Basic monitoring and logging

---

### Identity & Access

- Uses **Managed Identity** for Azure resource access
- Avoids storing credentials in code or configuration
- RBAC assignments added only where required

---

### Monitoring

- **Application Insights enabled**
- Log Analytics **not included in v1**
- No alerts configured initially

Reason:

- Keep cost low
- Add advanced monitoring later if needed

---

### Networking

- No VNet integration
- No private endpoints
- Public Azure endpoints used

Reason:

- Simpler setup
- Lower cost
- No current security requirement for isolation

---

### Data & Storage

- No database
- No long-term storage
- No state persistence between runs

---

### Notification Strategy (Application-level)

Handled by the application (not infrastructure):

- Primary: aggregated report → `it@nionit.com`
- Optional: per-app alerts → `access@nionit.com`

---

## Repository Structure

```text
opentofu/
├── modules/
│   ├── resource-group/
│   ├── storage-account/
│   ├── function-app/
│   └── monitoring/
│
└── environments/
    └── internal/
        ├── main.tf
        ├── variables.tf
        ├── terraform.tfvars
        └── README.md
```

---

## Modules

The infrastructure is split into small reusable modules:

| Module          | Purpose                              |
| --------------- | ------------------------------------ |
| resource-group  | Creates Azure Resource Group         |
| storage-account | Provides storage for Function App    |
| function-app    | Deploys Azure Function with identity |
| monitoring      | Sets up Application Insights         |

---

## Design Principles

- **Keep it simple** – avoid unnecessary abstraction
- **Keep it cheap** – serverless, consumption-based
- **Avoid overengineering** – no unused resources
- **Stateless by design**
- **Modular but minimal**

---

## Future Improvements (Not in v1)

These may be added later if required:

- Key Vault for secret management
- Log Analytics workspace
- Alerting / Action Groups
- Private networking (VNet / Private Endpoints)
- Role assignment module (if RBAC grows)

---

## Deployment

Typical workflow:

```bash
tofu init
tofu validate
tofu plan
tofu apply
```

---

## Notes

- Do not hardcode environment-specific values inside modules
- Use `terraform.tfvars` for environment configuration
- Keep modules reusable and generic
- Follow least-privilege principle for access
