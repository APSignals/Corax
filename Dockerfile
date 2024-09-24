# Use official PHP image as a base
FROM php:8.2-apache

# Install necessary dependencies for Moodle
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    mariadb-client \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip mysqli pdo pdo_mysql

# Enable Apache mod_rewrite for Moodle
RUN a2enmod rewrite

# Set working directory to /var/www/html
WORKDIR /var/www/html

# Copy Moodle source code to the container (assuming it's mounted later)
COPY . /var/www/html

# Set ownership and permissions for Moodle directory
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80 for Apache
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]