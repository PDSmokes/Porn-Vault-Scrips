#!/bin/bash



#Converts WMV
for i in /home/porn/downloads/needtoencode/*.wmv; do ffmpeg -y -i "$i" -c:v libx264 -preset fast -crf 23 -c:a aac "$(basename "$i" .wmv)".mp4 ; done
#Converts mkv
for i in /home/porn/downloads/needtoencode/*.mkv; do ffmpeg -y -i "$i" -c copy "$(basename "$i" .mkv)".mp4 ; done
#converts avi
for i in /home/porn/downloads/needtoencode/*.avi; do ffmpeg -y -i "$i" -c:v libx264 -preset fast -crf 23 -c:a aac "$(basename "$i" .avi)".mp4 ; done
#converts mov
for i in /home/porn/downloads/needtoencode/*.mov; do ffmpeg -y -i "$i" -c copy "$(basename "$i" .mov)".mp4 ; done
#converts flv
for i in /home/porn/downloads/needtoencode/*.flv; do ffmpeg -y -i "$i" -c:v libx264 -preset fast -crf 23 -c:a aac "$(basename "$i" .flv)".mp4 ; done

find /home/porn/downloads/needtoencode -type f -name "*.mp4" -exec mv {} /home/porn/downloads \;
find /root -type f -name "*.mp4" -exec mv {} "/home/porn/downloads" \;





