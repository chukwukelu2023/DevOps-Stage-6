FROM node:14-alpine AS builder
WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

# Production stage
FROM node:14-alpine

# Install serve globally
RUN npm install -g serve

WORKDIR /app

# Copy built files from builder stage
COPY --from=builder /app/dist ./dist

# Expose port
EXPOSE 8080

# Serve the application
CMD ["serve", "-s", "dist", "-l", "8080"]