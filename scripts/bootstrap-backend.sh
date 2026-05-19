#!/usr/bin/env bash

set -euo pipefail

RESOURCE_GROUP="rg-tofu-state-dev"
STORAGE_ACCOUNT="sttofustatedev01"
CONTAINER_NAME="tfstate"
LOCATION="swedencentral"

echo "Creating resource group..."
az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

echo "Creating storage account..."
az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2

echo "Creating blob container..."
az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT" \
  --auth-mode login

echo "Backend bootstrap completed."