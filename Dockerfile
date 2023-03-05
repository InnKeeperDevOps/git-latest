FROM bitnami/git:latest

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /src

RUN env

CMD /start.sh
