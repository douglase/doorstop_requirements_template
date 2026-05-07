#!/bin/bash

#this should all probably be a makefile

#run in a python 3 environment with doorstop installed (pip install -r requirements.txt)
doorstop import mission_L1.csv L1
doorstop import sci_L2.csv L2
doorstop import tech_L3.csv L3

doorstop

#publish as HTML (used by Beamer/LaTeX workflow, output lands in dist/documents/)
doorstop publish all ./dist

#publish as Markdown (GitHub-renderable, output lands in dist/*.md)
doorstop publish all ./dist -m

python RunGraphviz.py

#to make latex beamer slides, convert HTML to Beamer .tex files and compile:
make -f MakeBeamer
cd dist
pdflatex beamer.tex
