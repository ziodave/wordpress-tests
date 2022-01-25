#!/bin/bash

matrix=(
    '5.4|4.4|4.8|2|2.4.1'
    '5.5|4.4|4.8|2|2.5.5'
    '5.6|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8|4.8|2|2.5.5'
    '7.0|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8|4.8|2|2.6.1'
    '7.1|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8|7.5|6|2.9.8'
    '7.2|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8|7.5|6|3.1.1'
    '7.3|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8|7.5|6|3.1.1'
    '7.4|5.8,beta-5.9|7.5|6|3.1.1'
)

for fields in ${matrix[@]}; do
    IFS=$'|' read -r php_version fields phpunit_version php_code_coverage xdebug_version<<< "$fields"
    IFS=$',' read -r -a wordpress_versions <<< "$fields"
    for wordpress_version in ${wordpress_versions[@]}; do
        PHP_VERSION=$php_version WORDPRESS_VERSION=$wordpress_version PHPUNIT_VERSION=$phpunit_version PHP_CODE_COVERAGE=$php_code_coverage XDEBUG_VERSION=$xdebug_version sh -c ./build.sh
    done
done
