#!/bin/bash
cd /home/pi/ARM-32bit/GRoot
sudo /home/pi/ARM-32bit/Root/java/bin/java -Dmonocle.input.0/0/0/0.minX=3840 -Dmonocle.input.0/0/0/0.maxX=1600 -Dmonocle.input.0/0/0/0.minY=400 -Dmonocle.input.0/0/0/0.maxY=6400  -Dmonocle.input.0/0/0/0.flipXY=true -jar ./GRoot.jar -u 500 -s
