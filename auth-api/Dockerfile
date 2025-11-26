FROM golang:1.21-alpine3.20 AS build

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

# Copy the source code into the container and build the app
COPY . .
RUN go build  -o auth-api

# Deployment stage
FROM alpine:3.20
WORKDIR /app
# COPY --from=build /app ./
COPY --from=build /app/auth-api /usr/local/bin/auth-api

# Start the application
CMD auth-api