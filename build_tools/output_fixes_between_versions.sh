#!/bin/bash
if [ $# -ne 3 ]; then
echo "Usage: $0 <version from> <version to> <directory containing AutoMaker and CELTechCore repositories>";
else
git log --oneline $1..$2 | cut -d" " -f2-
cd $3/AutoMaker
git log --oneline $1..$2 | cut -d" " -f2-
cd $3/CELTechCore
git log --oneline $1..$2 | cut -d" " -f2-
fi
