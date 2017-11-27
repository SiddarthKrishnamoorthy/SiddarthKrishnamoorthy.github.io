#!/bin/sh

set -e

setup(){
    git config --global user.email travis@travis-ci.org
    git config --global user.name "Travis CI"
}

if [ $TRAVIS_BRANCH == "deployment" ]; then
    ./hugo --theme=academic
    setup
    cp -r public/ ../
    cd ../
    git add public/
    git commit -m "TRAVIS BUILD = $TRAVIS_BUILD_NUMBER"
    git push -f -q --force https://$GITHUB_TOKEN@github.com/SiddarthKrishnamoorthy/SiddarthKrishnamoorthy.github.io deployment:master
fi
