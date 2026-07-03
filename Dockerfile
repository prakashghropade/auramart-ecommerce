# Stage 1: Development/Build stage
FROM node:18-alpine AS builder

# set the working directory
WORKDIR /app

# Install the necessory build dependencies
RUN apk add --no-cahe python3 make g++

# copy the package files
COPY package*.json ./

# Install Dependencies
RUN npm ci

# copy all projecct files
COPY . .

# Build the Next.js application
RUN npm run build

# Stage 2: production stage
FROM node:18-alpine as runner

# set the working directory
WORKDIR /app

# copy the necessory files from the builder stage
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static/ ./.next/static
COPY --from=builder /app/public ./public

# set the environment variables
ENV NODE_ENV=production 
ENV PORT=3000

# Expose the port of the app runs on
EXPOSE 3000 

# command to run the application
CMD ["node", "server.js"]

