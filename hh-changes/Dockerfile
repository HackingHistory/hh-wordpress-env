FROM visiblevc/wordpress:latest
# ENV TERM=xterm
LABEL maintainer="Matt Price <matt.price@utoronto.ca>" \
      version="0.1"

# Install base requirements & sensible defaults + required PHP extensions
# RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list \
#     && curl -seb.nodesource.com/setup_6.x | bash - \
RUN apt-get update \
    && curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && echo 'deb https://deb.nodesource.com/node_6.x jessie main' > /etc/apt/sources.list.d/nodesource.list \
    && apt-get install -y apt-transport-https lsb-release \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apt-utils \
        # less \
        # libpng12-dev \
        # libjpeg-dev \
        # libxml2-dev \
        # mariadb-client \
        # unzip \
        # sudo \
        # vim \
        # zip \
        git \
        nodejs
    # && DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -y \
    #     python-certbot-apache \
    # && rm -rf /var/lib/apt/lists/* \
    # && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    # && docker-php-ext-install \
    #     exif \
    #     gd \
    #     mysqli \
    #     opcache \
    #     soap \
    #     zip \
    # # See https://secure.php.net/manual/en/opcache.installation.php
    # && echo 'memory_limit = 512M' > /usr/local/etc/php/php.ini \
    # && { \
    #     echo 'opcache.memory_consumption=128'; \
    #     echo 'opcache.interned_strings_buffer=8'; \
    #     echo 'opcache.max_accelerated_files=4000'; \
    #     echo 'opcache.revalidate_freq=2'; \
    #     echo 'opcache.fast_shutdown=1'; \
    #     echo 'opcache.enable_cli=1'; \
    # } > /usr/local/etc/php/conf.d/opcache-recommended.ini

COPY ./run.sh /run.sh

# Install wp-cli, configure apache, add scripts, create install directory & symlink
# RUN curl -s \
#         -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#         # use local run.sh instead
#         # -o /run.sh https://raw.githubusercontent.com/visiblevc/wordpress-starter/master/run.sh \
#     && chmod +x /usr/local/bin/wp /run.sh \
#     && curl -s \
#         https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash | \
#         sed -e "s/wp cli completions/wp cli completions --allow-root/" > /etc/bash_completion.d/wp-cli \
#     && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
#     && echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf && a2enconf fqdn \
#     && a2enmod rewrite expires \
#     && service apache2 restart \
#     && mkdir -p /app ~/.wp-cli \
#     && rm -fr /var/www/html \
#     && ln -s /app /var/www/html \
#     ## also create local-scripts dir \
#     && mkdir -p /local-scripts
RUN  chmod +x /run.sh \
     && mkdir -p /local-scripts /app/wp-content/themes/dev-theme /app/wp-content/plugins/dev-plugin \
     && npm install -g gulp
    # && chmod +x /local-scripts/*



WORKDIR /app
EXPOSE 80 443
CMD ["/run.sh"]
# CMD ["/bin/bash"]
# CMD ["/local-scripts/run.sh"]
