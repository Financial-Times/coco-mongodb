FROM mongo:3.2.21

ADD mongod.conf /etc/

EXPOSE 27017 28017

CMD exec mongod -f /etc/mongod.conf
