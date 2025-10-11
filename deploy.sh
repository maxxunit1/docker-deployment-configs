#!/bin/bash

# Docker Deployment Script
# Usage: ./deploy.sh [environment]

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    log_error "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    log_error "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Get environment (default: production)
ENVIRONMENT=${1:-production}

log_info "Starting deployment for environment: $ENVIRONMENT"

# Stop existing containers
log_info "Stopping existing containers..."
docker-compose down

# Remove old images (optional)
if [ "$2" == "--clean" ]; then
    log_warn "Cleaning old images..."
    docker system prune -af
fi

# Build images
log_info "Building Docker images..."
docker-compose build --no-cache

# Start containers
log_info "Starting containers..."
docker-compose up -d

# Wait for services to be ready
log_info "Waiting for services to be ready..."
sleep 10

# Health checks
log_info "Running health checks..."

# Check Node.js app
if curl -f http://localhost:3000/health &> /dev/null; then
    log_info "✅ Node.js app is healthy"
else
    log_error "❌ Node.js app health check failed"
fi

# Check Python app
if curl -f http://localhost:8000/health &> /dev/null; then
    log_info "✅ Python app is healthy"
else
    log_error "❌ Python app health check failed"
fi

# Check Nginx
if curl -f http://localhost/health &> /dev/null; then
    log_info "✅ Nginx is healthy"
else
    log_error "❌ Nginx health check failed"
fi

# Show running containers
log_info "Running containers:"
docker-compose ps

# Show logs (last 50 lines)
log_info "Recent logs:"
docker-compose logs --tail=50

log_info "Deployment completed successfully! 🚀"
log_info "Services are running at:"
log_info "  - Node.js app: http://localhost:3000"
log_info "  - Python app: http://localhost:8000"
log_info "  - Nginx proxy: http://localhost:80"