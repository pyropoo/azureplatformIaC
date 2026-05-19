# 002 - Remote State Management

## Status

Accepted

## Context

Infrastructure state must be shared, protected, and consistent across deployments and environments.

Local state files introduce risks such as:

- State loss
- Team conflicts
- Inconsistent deployments
- Lack of centralized control

## Decision

Azure Blob Storage is used for remote state management.

## Reasoning

Azure Blob Storage provides:

- Centralized state storage
- State locking support
- Better team collaboration
- Integration with Azure authentication
- Improved deployment consistency

The backend is separated from application infrastructure to reduce risk and simplify management.

## Consequences

### Positive

- Safer deployments
- Shared infrastructure state
- Improved reliability
- Better CI/CD compatibility

### Negative

- Requires backend bootstrap process
- Additional Azure resources required