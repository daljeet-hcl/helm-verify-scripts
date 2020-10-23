FROM alpine
RUN apk add curl bash 
copy ./myscript.sh .
copy ./canary_script.sh .

