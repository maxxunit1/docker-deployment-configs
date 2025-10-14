# Docker Deployment Configs

Production-ready Docker configurations and deployment scripts for microservices architecture.

## ✨ Features

- 🐳 Multi-container orchestration with Docker Compose
- 🔧 Dockerfiles for Node.js and Python applications
- 🌐 Nginx reverse proxy configuration
- 🚀 One-command deployment script
- 📦 Production-ready setup

## 🚀 Quick Start

### Prerequisites

- Docker 20.10+
- Docker Compose 2.0+

### Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/docker-deployment-configs.git
cd docker-deployment-configs
```

2. Configure environment:
```bash
cp .env.example .env
# Edit .env with your settings
```

3. Deploy:
```bash
chmod +x deploy.sh
./deploy.sh
```

## 📦 Services

### Node.js Application
- **Port:** 3000
- **Dockerfile:** `Dockerfile.nodejs`
- **Use case:** Frontend/Backend API

### Python Application
- **Port:** 8000
- **Dockerfile:** `Dockerfile.python`
- **Use case:** Data processing/ML services

### Nginx Proxy
- **Port:** 80
- **Config:** `nginx.conf`
- **Use case:** Load balancer/Reverse proxy

## 🔧 Usage

### Start all services
```bash
docker-compose up -d
```

### Stop all services
```bash
docker-compose down
```

### View logs
```bash
docker-compose logs -f
```

### Rebuild and restart
```bash
docker-compose up -d --build
```

### Deploy to production
```bash
./deploy.sh production
```

## 📂 Project Structure

```
docker-deployment-configs/
├── README.md                 # Documentation
├── .gitignore               # Git ignore rules
├── docker-compose.yml       # Multi-container orchestration
├── Dockerfile.nodejs        # Node.js container
├── Dockerfile.python        # Python container
├── nginx.conf               # Nginx configuration
└── deploy.sh                # Deployment script
```

## ⚙️ Configuration

### Environment Variables

Create a `.env` file:
```env
# Node.js App
NODE_ENV=production
NODE_PORT=3000

# Python App
PYTHON_ENV=production
PYTHON_PORT=8000

# Nginx
NGINX_PORT=80

# Database (optional)
DB_HOST=localhost
DB_PORT=5432
DB_NAME=myapp
```

### Docker Compose

The `docker-compose.yml` defines three services:
- **nodejs-app**: Node.js application
- **python-app**: Python application  
- **nginx**: Reverse proxy

### Nginx Configuration

Edit `nginx.conf` to customize:
- Upstream servers
- Load balancing
- SSL/TLS settings
- Cache configuration

## 🚀 Deployment

### Local Development
```bash
docker-compose up
```

### Production Deployment
```bash
./deploy.sh production
```

The deploy script will:
1. Pull latest code
2. Build Docker images
3. Stop old containers
4. Start new containers
5. Run health checks

### Manual Deployment

```bash
# Build images
docker-compose build

# Start services
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

## 🔍 Monitoring

### Health Checks

```bash
# Check all services
docker-compose ps

# Check specific service
docker-compose ps nodejs-app

# View service logs
docker-compose logs nodejs-app
```

### Container Stats

```bash
docker stats
```

## 🛠️ Troubleshooting

### Containers won't start

```bash
# Check logs
docker-compose logs

# Rebuild images
docker-compose build --no-cache

# Remove old containers
docker-compose down -v
```

### Port conflicts

```bash
# Change ports in docker-compose.yml
# Or stop conflicting services
sudo lsof -i :80
```

### Disk space issues

```bash
# Remove unused containers
docker system prune

# Remove unused images
docker image prune

# Remove all unused data
docker system prune -a
```

## 📝 Best Practices

1. **Use .dockerignore** - Exclude unnecessary files
2. **Multi-stage builds** - Reduce image size
3. **Health checks** - Monitor container health
4. **Volume mounts** - Persist data
5. **Environment variables** - Configure services
6. **Logging** - Centralized log management
7. **Security** - Scan images, use secrets

## 🔒 Security

- Don't commit `.env` files
- Use Docker secrets for sensitive data
- Scan images for vulnerabilities
- Run containers as non-root user
- Keep base images updated

## 📚 Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Best Practices](https://docs.docker.com/develop/dev-best-practices/)

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing`)
3. Commit changes (`git commit -m 'Add feature'`)
4. Push to branch (`git push origin feature/amazing`)
5. Open Pull Request

## 📄 License

MIT License - see LICENSE file for details

## 🙏 Acknowledgments

- Docker community
- Nginx team
- Open source contributors

---

**Made with ❤️ for DevOps engineers**

## Update 2025-10-12 13:51:17
# Improved: 2025-10-12 13:51:17
# Additional configuration

## Update 2025-10-14 15:56:33
# Updated: 2025-10-14 15:56:33
def updated_function():
    pass