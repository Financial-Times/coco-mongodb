FROM mongo:3.7.9-xenial

ADD mongod.conf /etc/

EXPOSE 27017 28017

CMD exec mongod -f /etc/mongod.conf
