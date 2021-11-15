#!/bin/sh

export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

PHP_CODE_COVERAGE=${PHP_CODE_COVERAGE:-2}
PHP_VERSION=${PHP_VERSION:-7.2}
PHPUNIT_VERSION=${PHPUNIT_VERSION:-4.8}
WORDPRESS_VERSION=${WORDPRESS_VERSION:-5.3}
XDEBUG_VERSION=${XDEBUG_VERSION:-2.5.5}
TAG=wordpress-tests:php${PHP_VERSION}-phpunit${PHPUNIT_VERSION}-wordpress${WORDPRESS_VERSION}

echo "Building $TAG..."

docker build \
  --build-arg PHP_CODE_COVERAGE=$PHP_CODE_COVERAGE \
  --build-arg PHPUNIT_VERSION=$PHPUNIT_VERSION \
  --build-arg WORDPRESS_VERSION=$WORDPRESS_VERSION \
  --build-arg PHP_VERSION=$PHP_VERSION \
  --build-arg XDEBUG_VERSION=$XDEBUG_VERSION \
  -t ziodave/$TAG . \

echo "Pushing $TAG..."

docker push ziodave/$TAG
