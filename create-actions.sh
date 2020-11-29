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

phpunit_version=4.8
release=v0.0.1

for fields in ${matrix[@]}; do
    IFS=$'|' read -r php_version fields <<< "$fields"
    IFS=$',' read -r -a wordpress_versions <<< "$fields"
    for wordpress_version in ${wordpress_versions[@]}; do
        image_tag=php${php_version}-phpunit${phpunit_version}-wordpress${wordpress_version}
        image_name=docker://ziodave/wordpress-tests:$image_tag
        git_tag=$image_name-$release
        sed -e "s/__IMAGE_NAME__/${image_name//\//\\/}/g" action.template.yml
        git commit -m "Create action.yml for $image_name"
        git tag -a -m "Tagging $git_tag" git_tag
        git push --follow-tags
    done
done
