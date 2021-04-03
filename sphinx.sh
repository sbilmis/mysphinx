#!/bin/bash

### We will install sphinx and read the docs theme first.

# to install the sphinx
pip instal sphinx
# to install the rtd-theme
pip install sphinx-rtd-theme


#### First, on your github-page create a new repository. Then give the same name when you are asked

### define the current working directory
mycwd=$(pwd)

echo What should the new repository be called?
read name
master="./$name/master"

echo Create path
mkdir -p $master && cd $master

echo Create first entry
git init && touch Readme.md && git add Readme.md && git commit -m "Initial commit"

### copy the github link of the repository that you created
echo What is the GitHub address?
read github

echo Upload repository to GitHub
git remote add origin $github && git push -u origin master

echo Clone Repository
cd .. && git clone $github gh-pages && cd gh-pages

echo Create gh-branches and automatic change
git branch gh-pages && git symbolic-ref HEAD refs/heads/gh-pages

echo Clear branch
rm .git/index && git clean -fdx

echo Initializing Sphinx
cd .. && mkdir -p ./master/docs && cd ./master/docs && sphinx-quickstart

### cp your Makefile and conf.py file

# you are in the docs folder now

cp -a $mycwd/Makefile ./
cp -a $mycwd/conf.py ./source/
cp -a $mycwd/sphinxhook ../.git/hooks/

cd $mycwd/$name/master/docs && make github
## move the git folder 
mv $mycwd/$name/gh-pages/.git $mycwd/$name/gh-pages/html/

cd $mycwd/$name/master/.git/hooks && ./sphinxhook

cd $mycwd/$name

exit 0
