#!/bin/sh
set -e

echo "Waiting for backend services..."

until nc -z auth-service 8000; do
  echo "Waiting for auth-service..."
  sleep 2
done

until nc -z company-service 8000; do
  echo "Waiting for company-service..."
  sleep 2
done

until nc -z seeker-service 8000; do
  echo "Waiting for seeker-service..."
  sleep 2
done

until nc -z chat-service 8000; do
  echo "Waiting for chat-service..."
  sleep 2
done

echo "All backend services are reachable. Starting nginx..."
nginx -g 'daemon off;'