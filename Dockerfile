echo 'FROM nginx:alpine

# Set the working directory to Nginx's HTML directory
WORKDIR /usr/share/nginx/html

# Remove default Nginx HTML files
RUN rm -rf ./*

# Install git and clone your portfolio repository
RUN apk add --no-cache git && \
    git clone https://github.com/Tejas678G/portfolio.git /temp-repo && \
    cp -r /temp-repo/* . && \
    rm -rf /temp-repo

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]' > Dockerfile
