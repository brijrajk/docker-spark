FROM spark-base:3.5.1-hadoop3

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY history-server.sh /

EXPOSE 18081

CMD ["/bin/bash", "/history-server.sh"]
