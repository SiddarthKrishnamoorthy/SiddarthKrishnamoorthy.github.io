#!/bin/sh

set -e

setup(){
    git config --global user.email travis@travis-ci.org
    git config --global user.name "Travis CI"
}

setup
cp -r public/ ../
cd ../
git add --all public/
git commit -m "TRAVIS BUILD = $TRAVIS_BUILD_NUMBER"
git push -f -q https://$GITHUB_TOKEN@github.com/SiddarthKrishnamoorthy/SiddarthKrishnamoorthy.github.io master &2>/dev/null
