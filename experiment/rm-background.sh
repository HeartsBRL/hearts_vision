#!/bin/bash

# remove backround from images given one or more background images

python src/steve/scripts/rm-background.py images/pringles.png --b images/background.png --save images/image.png --erode 2 
