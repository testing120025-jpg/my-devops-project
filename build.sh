#!/bin/bash
set -e

echo "Starting test cluster..."
docker compose up -d

echo "Waiting for containers to initialize..."


echo "Waiting for MySQL to be ready..."
until docker compose exec db mysqladmin --user=root --password=root --host=db --silent --wait=10 ping; do
  echo "MySQL not ready, waiting..."
  sleep 5
done

echo "Running tests..."
docker compose run --rm test node test.js

echo "Stopping cluster..."
docker compose down

