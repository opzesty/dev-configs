#!/bin/bash
mkdir -p ~/Pictures/Screenshots

FILENAME="screenshot-`date +%F-%T`"
grim -g "$(slurp)" ~/Pictures/Screenshots/$FILENAME.png
