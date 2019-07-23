FROM mongo:3.4.9-jessie

ADD mongod.conf /etc/

EXPOSE 27017 28017

CMD exec mongod -f /etc/mongod.conf
