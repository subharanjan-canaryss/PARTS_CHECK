# Stage 1: Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source code and build
COPY . .
RUN npm run build

# Stage 2: Production stage
FROM nginx:1.25-alpine

# Set environment variables
ENV NODE_ENV=production \
    APP_PORT=80 \
    TZ=Asia/Kolkata
# Copy built files from builder
COPY --from=builder /app/dist /usr/share/nginx/html

# Add custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf
# Create a volume for logs
VOLUME ["/var/log/nginx"]

# Expose port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
