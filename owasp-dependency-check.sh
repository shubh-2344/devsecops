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

# Check NVD API key
if [ -z "${NVD_API_KEY:-}" ]; then
    echo "ERROR: NVD_API_KEY is empty"
    exit 1
fi

echo "NVD API key received: YES"
echo "NVD API key length: ${#NVD_API_KEY}"

# Create persistent directories
mkdir -p "$DATA_DIRECTORY"
mkdir -p "$CACHE_DIRECTORY"
mkdir -p "$REPORT_DIRECTORY"

echo "Data directory: $DATA_DIRECTORY"
echo "Report directory: $REPORT_DIRECTORY"

# Pull Dependency-Check image
echo "Pulling OWASP Dependency-Check image..."
docker pull "owasp/dependency-check:$DC_VERSION"

# Run Dependency-Check
echo "Starting Dependency-Check scan..."

docker run --rm \
    -u "$(id -u):$(id -g)" \
    --volume "$(pwd):/src:z" \
    --volume "$DATA_DIRECTORY:/usr/share/dependency-check/data:z" \
    --volume "$REPORT_DIRECTORY:/report:z" \
    "owasp/dependency-check:$DC_VERSION" \
    --scan /src \
    --format ALL \
    --project "$DC_PROJECT" \
    --out /report \
    --nvdApiKey="$NVD_API_KEY" \
    --disableNodeAudit \
    --failOnCVSS 8

echo "=========================================="
echo "Dependency-Check completed successfully"
echo "Reports available in: $REPORT_DIRECTORY"
echo "=========================================="
