#!/usr/bin/bash
#recording all actions in a file
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>actions.log 2>&1

# find all files with size more than 5kb in the directory 
# structure of test2 (zuul repository) and then compress them with tar 
# into a file tar.gz
find /c/Users/Zinji/test2/ -type f -size +5k | tar -czf tar.gz --null -T -

# find and delete any tar.gz file within the zuul directory structure # older than 1 week
find /c/Users/Zinji/test2/ -mtime +7 -name "*.tar.gz" -exec rm {} \;