# Use the official Puppeteer image
FROM ghcr.io/puppeteer/puppeteer:23.7.0

# Set environment variables to skip downloading Chrome (already present in this image)
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files to the container
COPY package*.json ./

# Use npm install if package-lock.json is missing or if npm ci fails
RUN npm install

# Copy the rest of the application code
COPY . .

# Specify the command to start your app
CMD ["node", "index.js"]
