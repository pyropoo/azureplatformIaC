#!/usr/bin/env bash
set -euo pipefail

ENVIRONMENT="${1:-dev}"

cd "$(dirname "$0")/../opentofu/environments/${ENVIRONMENT}"

tofu init
tofu validate