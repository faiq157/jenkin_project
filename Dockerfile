# Use Node base image
FROM node:18

# Set work directory
WORKDIR /app

# Copy files
COPY package*.json ./
RUN npm install
COPY . .

# Expose port and start app
EXPOSE 3000
CMD ["npm", "start"]
