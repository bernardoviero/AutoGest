FROM php:8.4-fpm

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    curl \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql mbstring exif pcntl bcmath xml

# Instala Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Corrige permissões no build (útil para volumes)
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Instala Redis extension
RUN pecl install redis && docker-php-ext-enable redis

WORKDIR /var/www

# Permissões (ajustadas depois via volume)
RUN chown -R www-data:www-data /var/www

CMD ["php-fpm"]
