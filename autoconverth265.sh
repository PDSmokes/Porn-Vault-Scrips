#!/bin/bash

#for i in *.wmv; do ffmpeg -i "$i" "${i%.*}.mp4"; done
find /home/porn/evelyn_lin_x265 -name "* *" -type f | rename 's/ /_/g'
#for i in /home/porn/downloads/needtoencode/*.wmv; do ffmpeg -y -i "$i" -c:v libx264 -preset fast -crf 23 -c:a aac "$(basename "$i" .wmv)".mp4 ; done
#for i in /home/porn/downloads/needtoencode/*.mkv; do ffmpeg -y -i "$i" -c copy "$(basename "$i" .mkv)".mp4 ; done
#for i in /home/porn/downloads/needtoencode/*.avi; do ffmpeg -y -i "$i" -c:v libx264 -preset fast -crf 23 -c:a aac "$(basename "$i" .avi)".mp4 ; done
#for i in /home/porn/downloads/needtoencode/*.mov; do ffmpeg -y -i "$i" -c copy "$(basename "$i" .mov)".mp4 ; done
for i in /home/porn/evelyn_lin_x265/*.mp4; do ffmpeg -y -i "$i" -c:v libx264 -preset fast -crf 18 -c:a copy "$(basename "$i" x265.mp4)"evelyn_lin.mp4 ; done

#find /home/porn/downloads/needtoencode -type f -name "*.mp4" -exec mv {} /home/porn/downloads \;



#find $dir -type f -name "*.mkv" -exec bash -c 'ffmpeg -y -i "{}" -c copy ${f%.mkv}.mp4' \;
#sleep 2
#find $dir -type f -name "*.wmv" -exec bash -c 'ffmpeg -y -i "{}" -c:v libx264 -preset fast -crf 23 -c:a aac ${f%.wmv}.mp4' \;
#sleep 2
#find $dir -type f -name "*.avi" -exec bash -c 'ffmpeg -y -i "{}" -c:v libx264 -preset fast -crf 23 -c:a aac ${f%.avi}.mp4' \;
#sleep 2
#find $dir -type f -name "*.mov" -exec bash -c 'ffmpeg -y -i "{}" -c copy ${f%.mov}.mp4' \;


