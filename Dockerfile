FROM alpine
RUN apk add curl 
copy ./myscript.sh .

