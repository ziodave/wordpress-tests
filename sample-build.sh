#!/bin/sh

PHP_VERSION=${PHP_VERSION:-7.2}
PHPUNIT_VERSION=${PHPUNIT_VERSION:-4.8}
WORDPRESS_VERSION=${WORDPRESS_VERSION:-5.3}
TAG=wordpress-tests:php${PHP_VERSION}-phpunit${PHPUNIT_VERSION}-wordpress${WORDPRESS_VERSION}

echo "Building $TAG..."

docker build --build-arg PHPUNIT_VERSION=$PHPUNIT_VERSION \
  --build-arg WORDPRESS_VERSION=$WORDPRESS_VERSION \
  --build-arg PHP_VERSION=$PHP_VERSION \
  -t ziodave/$TAG . \

echo "Pushing $TAG..."

docker push ziodave/$TAG
