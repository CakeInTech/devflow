# Use official Node.js image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Install dependencies in smaller layer first
COPY package*.json ./

# Install with legacy-peer-deps flag to avoid version conflicts
RUN npm install --legacy-peer-deps

# Copy the rest of the app
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port Next.js will run on
EXPOSE 3000

# Start the app in production mode
CMD ["npm", "start"]
