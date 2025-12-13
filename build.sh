#!/bin/bash
set -e

echo "Starting test cluster..."
docker compose up -d  # Starts in detached mode to allow script to continue

echo "Waiting for containers to initialize..."

# Wait for MySQL to be ready (better than using a fixed sleep time)
echo "Waiting for MySQL to be ready..."
until docker compose exec db mysqladmin --user=root --password=root --host=db --silent --wait=10 ping; do
  echo "MySQL not ready, waiting..."
  sleep 5
done

echo "Running tests..."
docker compose run --rm test node /tests/test.js  # Ensure test.js is in the correct path

echo "Stopping cluster..."
docker compose down

