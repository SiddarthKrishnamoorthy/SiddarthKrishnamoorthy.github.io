#!/bin/sh

setup(){
    git config --global user.email travis@travis-ci.org
    git config --global user.name "Travis CI"
}

commit_files(){
    git checkout -b deployment
    mv public/* ../
    cd ../
    rm sitemap
    git commit -am "Travis build: $TRAVIS_BUILD_NUMBER"
}

push_master(){
    git push -f -q https://$GITHUB_TOKEN@github.com/SiddarthKrishnamoorthy/SiddarthKrishnamoorthy.github.io master &2>/dev/null
}

setup
commit_files
push_master
