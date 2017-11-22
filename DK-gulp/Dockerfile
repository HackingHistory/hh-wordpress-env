# FROM monostream/nodejs-gulp-bower
# Pull base image.
# FROM node:8-alpine
FROM node:6-alpine

MAINTAINER Matt Price <matt.rice@utoronto.ca>
# Install dependencies
RUN apk add --quiet --no-cache bash git python build-base && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    yarn global add bower gulp && \
    yarn cache clean && \
    rm -rf /var/cache/apk/* /tmp/*

COPY ./run-gulp.sh /
RUN chmod a+x /run-gulp.sh \
    && mkdir -p /wordpress/wp-content/themes/

WORKDIR /wordpress/wp-content/themes
CMD ["/run-gulp.sh"]
