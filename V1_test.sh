#!/bin/bash

command -v ffmpeg >/dev/null 2>&1 || { echo >&2 "Che, no está el ffmpeg instalado."; exit 1; }

if [ "$#" -ne 2 ]; then
	echo "Estás poniendo mal los archivos salame.";
fi

COVER=$1
FILE=$2

ffmpeg -loop 1 -i $COVER -c:v h264 -t 1 v1.mp4
ffmpeg -i v1.mp4  -i $FILE -strict experimental -c:v copy -c:a aac -b:a 384k video.mp4

rm v1.mp4
echo "Listo master"
