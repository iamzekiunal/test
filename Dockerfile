FROM nginx:alpine

# Remove default nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Create and add custom configuration file directly
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
    } \
    error_page 500 502 503 504 /50x.html; \
    location = /50x.html { \
        root /usr/share/nginx/html; \
    } \
}' > /etc/nginx/conf.d/nginx.conf

# Create a simple HTML file that says "hello"
RUN mkdir -p /usr/share/nginx/html
RUN echo "<html><body><h1>hello</h1></body></html>" > /usr/share/nginx/html/index.html
ADD index.html /usr/share/nginx/html/index.html
# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]