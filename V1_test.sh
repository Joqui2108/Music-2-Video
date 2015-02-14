#!/bin/bash

if [ $# -ne 2 ]
	then echo "Estás poniendo mal los archivos salame.";
fi

ffmpeg -loop 1 -i $1 -c:v h264 -t 1 v1.mp4
ffmpeg -i v1.mp4  -i $2 -strict experimental -c:v copy -c:a aac -b:a 384k video.mp4

rm v1.mp4
echo "Listo master"
