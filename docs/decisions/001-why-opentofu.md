# 001 - Why OpenTofu

## Status

Accepted

## Context

The platform requires an Infrastructure as Code solution capable of managing Azure infrastructure in a modular, reusable, and scalable way.

The tooling should support:

- Reusable modules
- Remote state
- CI/CD workflows
- Team collaboration
- Long-term maintainability

## Decision

OpenTofu was selected as the primary Infrastructure as Code tool.

## Reasoning

OpenTofu provides:

- Terraform compatibility
- Open-source governance
- Strong Azure ecosystem support
- Mature module ecosystem
- CI/CD integration support
- Familiar workflow patterns

The decision also allows compatibility with existing Terraform-based tooling and workflows.

## Consequences

### Positive

- Reusable infrastructure
- Standardized deployments
- Large ecosystem support
- Easier automation

### Negative

- Requires state management
- Additional learning complexity
- Azure provider changes must be monitored