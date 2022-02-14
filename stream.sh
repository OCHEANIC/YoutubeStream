###########################################
# Add your stream Key in KEY="STREAM KEY" #
# Change the Video source if you want to  #
# Change the audio source if you want to  #
###########################################


output "Youtube Stream 24/7 Version 0.0.1"
output
output "Copyright (C) 2021 - 2022, Ocheanic <contact@ocheanic.tech"
output "https://github.com/OCHEANIC/YoutubeStream"
output
output "Donate - https://paypal.me/ocheanicgamerz"
output "Thanks for using this script"

printf "Starting the Stream Make shurey ou have configured everything or it won't work\n"
if [[ $EUID -ne 0 ]]; then
  echo "* This script must be executed with root privileges (sudosu)." 1>&2
  exit 1
fi
#! /bin/bash
 
VBR="1000k"
FPS="25"
QUAL="ultrafast"
 
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"
KEY="YourStreamKeyHere"
 
VIDEO_SOURCE="https://www.dropbox.com/s/muh9bvz7nem437f/video.mp4"
AUDIO_SOURCE="https://www.dropbox.com/s/zd2cu6bw4exbxha/videoplayback.m4a"
 
ffmpeg \


-re -f lavfi -i "movie=filename=$VIDEO_SOURCE:loop=0, setpts=N/(FRAME_RATE*TB)" \
-thread_queue_size 512 -i "$AUDIO_SOURCE" \
-map 0:v:0 -map 1:a:0 \
-map_metadata:g 1:g \
-vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
-acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
-f flv "$YOUTUBE_URL/$KEY"
