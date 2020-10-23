#!/bin/sh

url=$1/env/VERSION

echo conencting to $url
value=$(curl $url | grep -c $2)

echo count of $2 search String = $value

if [ "$value" == "0" ]; 
then
   echo "search string not found" 	
   exit 1
else 
   echo "search string found"	
   exit 0
fi


