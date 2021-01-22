#!/bin/sh

#This script depends on the structure /home/porn/ftp/files/Stars/. This folder must exsists otherwise this script will not work. The reason wit is made like so is because it is a fucking mess that i don't care to fix

#Creates a txt file in home/porn/ftp/files/Stars/ called actors.txt. This txt file will have a list of all the folder names in the Stars folder.
ls /home/porn/ftp/files/Stars > /home/porn/ftp/files/Stars/actors.txt

#Moves all mp4 files to /home/porn/downloads excluding files in the folders needtoencode, seeding, notcreated, incomplete and previews
find /home/porn/downloads/*/ -type d \( -name notcreated -o -name needtoencode -o -name seeding -o -name previews -o -name incomplete \) -prune -false -o -type f -name "*.mp4" -exec mv {} /home/porn/downloads \;

#Renames all files starting with www.0xxx.ws_ simply removing that string from the filename. More text to look for and remove can be added here.
find /home/porn/downloads -name 'www.0xxx.ws_*.mp4*' -type f -exec bash -c 'mv "$1" "${1/\/www.0xxx.ws_//}"' -- {} \;


#This part will search for the *$MOVIE*.mp4 and see if it matches any line in /home/porn/ftp/files/Stars/actors.txt. 
#If it does, the file will be moved to the corresponding folder. If not, it will be moved to /home/porn/downloads/notcreated
for MOVIE in /home/porn/ftp/files/Stars/*
do
	MOVIE=$(basename "$MOVIE") 
	SEARCH_STRING=$(echo *$MOVIE*.mp4 | sed 's/ /*/g')
	find /home/porn/downloads -type f -name "$SEARCH_STRING" -printf '%f\n'
	find /home/porn/downloads -path /home/porn/downloads/needtoencode -prune -false -o -type f -name "$SEARCH_STRING" -exec mv -v {} "/home/porn/ftp/files/Stars/$MOVIE"  \;
done


#This is just the dirtiest most unoptimized way of sorting through all the shit. It works okay with 7TB and runs in a matter of seconds. So it should be fine. Fuck it.
#This will find and move all files that end with avi,wmv,flv,m4v,mov or mkv to the /home/porn/downloads/needtoencode folder for later encoding by the encoding script.
find /home/porn/downloads -path /home/porn/downloads/needtoencode -prune -false -o -type f \( -iname \*.avi -o -iname \*.wmv -o -iname \*.flv -o -iname \*.m4v -o -iname \*.mov -o -iname \*.mkv \) -exec mv {} /home/porn/downloads/needtoencode \;
#Some downloads come with a txt file like a readme. This line looks for txt files and gets rid of em in /home/porn/downloads
find /home/porn/downloads -type f -name "*.txt" -delete
#This line deletes all the other junk. Anything with the word thumbnail or screenshot in it or ending with png,gif,jpg  gets deleted 
find /home/porn/downloads -type f \( -iname \*preview* -o -iname \*thumbnail* -o -iname \*screenshot -o -iname \*.png -o -iname \*.gif -o -iname \*.jpeg -o -iname \*.jpg \) -delete
# Moves all zipfiles to /home/porn/downloads/zipfiles
find /home/porn/downloads -type d -name zipfiles -prune -false -o -type f -name "*.zip" -exec mv {} /home/porn/downloads/zipfiles \;
#This will move all mp4 files that are not in notcreated, needtoencode, seeding, previews or incomplete to notecreated
find /home/porn/downloads -type d \( -name notcreated -o -name needtoencode -o -name seeding -o -name previews -o -name incomplete \) -prune -false -o -type f -name "*.mp4" -exec mv {} /home/porn/downloads/notcreated \;
#This deletes all empty folders
find /home/porn/downloads -type d -not \( -name needtoencode -o -name Jdownloader -o -name seeding -o -name zipfiles -o -name notcreated -o -name previews -o -name incomplete \) -empty -delete
#This checks for any mp4 files in /root and if there is any moves them to /home/porn/downloads. Encode script sometimes encoded vidoes to root and the script seemed okay. So this was a lazy fix
find /root -maxdepth 1 -type f -name "*.mp4" -exec mv {} "/home/porn/downloads/" \;

