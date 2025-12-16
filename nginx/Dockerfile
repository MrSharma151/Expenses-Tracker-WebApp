# ------------------------------------------------------
# NGINX base image (lightweight Alpine)
# ------------------------------------------------------
FROM nginx:1.23.3-alpine

# ------------------------------------------------------
# Remove default NGINX config to avoid conflicts
# ------------------------------------------------------
RUN rm /etc/nginx/conf.d/default.conf

# ------------------------------------------------------
# Copy custom NGINX reverse proxy configuration
# ------------------------------------------------------
COPY nginx/default.conf /etc/nginx/conf.d/default.conf


# ------------------------------------------------------
# Expose HTTP port
# ------------------------------------------------------
EXPOSE 80
