FROM php:7.2-apache
LABEL maintainer "Erick Agrazal (erick@agrazal.com)"

# Set desired phpMyAdmin version
RUN apt-get update && \
	apt-get install -y --no-install-recommends libbz2-dev zlib1g-dev && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
    # Install PHP Extensions
	docker-php-ext-install bz2 mbstring mysqli zip

COPY ./src /var/www/html/
