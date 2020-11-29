#!/bin/bash

matrix=(
    '5.3|4.4'
    '5.4|4.4'
    '5.5|4.4'
    '5.6|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5'
    '7.0|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5'
    '7.1|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5'
    '7.2|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5'
    '7.3|4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5'
)

for fields in ${matrix[@]}; do
    IFS=$'|' read -r php_version fields <<< "$fields"
    IFS=$',' read -r -a wordpress_versions <<< "$fields"
    for wordpress_version in ${wordpress_versions[@]}; do
        PHP_VERSION=$php_version WORDPRESS_VERSION=$wordpress_version sh -c ./sample-build.sh
    done
done
