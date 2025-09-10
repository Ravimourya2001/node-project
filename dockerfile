# Use Node.js LTS version
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies first
COPY package*.json ./

# Install only production dependencies 
RUN npm install --only=production

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
