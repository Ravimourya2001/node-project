# Stage 1: Build stage (dev tools)
FROM node:18-alpine AS build

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Production stage
FROM node:18-alpine AS production

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production
COPY --from=build /usr/src/app .

EXPOSE 3000

# Run the app
CMD ["npm", "start"]
