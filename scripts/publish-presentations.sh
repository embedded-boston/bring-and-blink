#!/usr/bin/env bash

MDTOSLIDES="markdown-to-slides"
GIT_BASEDIR=`git rev-parse --show-toplevel`

mkdir slides
for lesson in $GIT_BASEDIR/lessons/*; do
    $MDTOSLIDES $lesson/README.md -i -o $GIT_BASEDIR/slides/$(basename $lesson).html --document-mode flag
done

mv slides /tmp/slides
git checkout gh-pages
rm -r $GIT_BASEDIR/slides
mv /tmp/slides slides
tree .
git add $GIT_BASEDIR/slides
git commit -m "Added slides"
git push origin gh-pages
git checkout master
