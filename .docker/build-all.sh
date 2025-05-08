#!/bin/bash

matrix=(
    '8.0|5.9,6.0,6.1,6.2|7.5|6|3.1.1'
)

for fields in ${matrix[@]}; do
    IFS=$'|' read -r php_version fields phpunit_version php_code_coverage xdebug_version<<< "$fields"
    IFS=$',' read -r -a wordpress_versions <<< "$fields"
    for wordpress_version in ${wordpress_versions[@]}; do
        PHP_VERSION=$php_version WORDPRESS_VERSION=$wordpress_version PHPUNIT_VERSION=$phpunit_version PHP_CODE_COVERAGE=$php_code_coverage XDEBUG_VERSION=$xdebug_version sh -c ./build.sh
    done
done
