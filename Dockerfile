FROM php:8.1-apache

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
  libzip-dev \
  zip \
  unzip \
  && docker-php-ext-install zip

# Enable other necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set the ownership and permissions of the required directories
# RUN mkdir -p /var/www/html/var /var/www/html/plugins /var/www/html/www/admin/plugins /var/www/html/www/images \
#   && chown -R www-data:www-data /var/www/html/var /var/www/html/plugins /var/www/html/www/admin/plugins /var/www/html/www/images \
#   && chmod -R 775 /var/www/html/var /var/www/html/plugins /var/www/html/www/admin/plugins /var/www/html/www/images

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
