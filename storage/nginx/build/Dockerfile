# Use the latest Alpine-based Nginx image
FROM nginx:stable-alpine

# Copy the custom Nginx configuration
COPY ./storage/nginx/config/default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 8081

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
