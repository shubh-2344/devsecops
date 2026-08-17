#!/bin/sh

set -e

DC_VERSION="latest"
DC_DIRECTORY="$HOME/OWASP-Dependency-Check"
DC_PROJECT="ticketmanagement"

DATA_DIRECTORY="$DC_DIRECTORY/data"
CACHE_DIRECTORY="$DC_DIRECTORY/data/cache"
REPORT_DIRECTORY="$(pwd)/reports"

echo "=========================================="
echo "OWASP Dependency-Check SCA"
echo "=========================================="

# Create persistent directories
mkdir -p "$DATA_DIRECTORY"
mkdir -p "$CACHE_DIRECTORY"
mkdir -p "$REPORT_DIRECTORY"

echo "Data directory: $DATA_DIRECTORY"
echo "Report directory: $REPORT_DIRECTORY"

# Pull latest Dependency-Check image
echo "Pulling OWASP Dependency-Check image..."
docker pull owasp/dependency-check:$DC_VERSION

# Run Dependency-Check
echo "Starting Dependency-Check scan..."

docker run --rm \
    -e NVD_API_KEY="$NVD_API_KEY" \
    -u "$(id -u):$(id -g)" \
    --volume "$(pwd):/src:z" \
    --volume "$DATA_DIRECTORY:/usr/share/dependency-check/data:z" \
    --volume "$REPORT_DIRECTORY:/report:z" \
    owasp/dependency-check:$DC_VERSION \
    --scan /src \
    --format "ALL" \
    --project "$DC_PROJECT" \
    --out /report \
    --nvdApiKey "$NVD_API_KEY" \
    --disableNodeAudit \
    --failOnCVSS 7

echo "=========================================="
echo "Dependency-Check completed successfully"
echo "Reports available in: $REPORT_DIRECTORY"
echo "=========================================="
