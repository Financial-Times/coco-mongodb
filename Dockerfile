FROM mongo

ADD mongod.conf /etc/

EXPOSE 27017 28017

CMD mongod -f /etc/mongod.conf

