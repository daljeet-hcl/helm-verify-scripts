#!/bin/sh
# this script is to be called only when .Values.USE_CANARY is true.
echo on
echo executing verify canary script

echo VERSION to search : $2
echo CANARY_VERSION to search: $3

url=$1 #/env/VERSION

echo conencting to $url

target=$(curl $url)
value=$(echo $target | grep -c "$2\|$3" )
if [ "$value" == "0" ];
then 
    echo "search string not found"
    exit 1
else
# one of the search string has been found

      new_search=0;
      value2=$(echo $target | grep -c $2 )
      if [ "$value2" == "0" ];
      then
         echo $3 has been found
         new_search=$2
      else
         echo $2 has been found
         new_search=$3
      fi

      for i in 1 2 3 4 5
      #try to find the other string now which has not been found earlier
      do
         echo connecting to $url
         value3=$(curl $url | grep -c new_search)
         echo count of $2 search String = $value

         if [ "$value3" == "0" ];
            then
               echo "try $i for second search unsucessful" 
            else
               echo second search string $new_search found
               exit 0
         fi   
      done
   exit 1
fi
