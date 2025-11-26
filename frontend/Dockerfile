# FROM node:14-alpine AS builder
# WORKDIR /app

# ARG PORT
# ARG AUTH_API_ADDRESS
# ARG TODOS_API_ADDRESS


# ENV PORT=$PORT
# ENV AUTH_API_ADDRESS=$AUTH_API_ADDRESS
# ENV TODOS_API_ADDRESS=$TODOS_API_ADDRESS

# COPY package*.json .

# RUN npm install

# COPY . .

# RUN npm run build

# # Production stage
# FROM node:14-alpine

# # Install serve globally
# RUN npm install -g serve

# WORKDIR /app

# # Copy built files from builder stage
# COPY --from=builder /app/dist ./dist

# # Expose port
# EXPOSE 8080

# # Serve the application
# CMD ["serve", "-s", "dist", "-l", "8080"]

FROM node:14-alpine AS builder
WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

CMD [ "npm","run","dev" ]
