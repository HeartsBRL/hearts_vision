#!/bin/bash

# remove background from first image, using a number of sample backgrounds (--b) taken from the same angle
# saves the processed image (--save)
# The algorithm cannot remove shadows properly

python src/steve/scripts/rm-background.py 'photos/cv - 1.jpg' --b 'photos/cv - 2.jpg' 'photos/cv - 3.jpg' 'photos/cv - 4.jpg' --save photos/pringles.jpg