FROM alpine

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "@main http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && apk --update add mongodb@testing boost@main boost-program_options@main

ADD mongod.conf /etc/
EXPOSE 27017 28017
CMD mongod -f /etc/mongod.conf
