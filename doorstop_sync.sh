#!/bin/bash

#this should all probably be a makefile

#run in a python 3 environment with doorstop, e.g. source activate py3_5
doorstop import mission_L1.csv L1
doorstop import sci_L2.csv L2
doorstop import tech_L3.csv L3

doorstop

#publish as html
doorstop publish all ./dist
#doorstop publish all ./markdown -m

#call pandoc to convert html to markdown
make -f MakeFile

#clean up the titles of the published requirements by remove everything between {# and } 
sed -i '' -e 's/{.*}//' dist/*.markdown

#change published links to point to markdown files:
sed -i '' -e 's/.html/.markdown/g' dist/*.markdown

python RunGraphviz.py

python MakeLinksGitHubFriendly.py

#make latex files
make -f MakeBeamer
cd dist
pdflatex beamer.tex
