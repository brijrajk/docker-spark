FROM spark-base:3.5.1-hadoop3

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

ENV SPARK_MASTER_NAME=spark-master
ENV SPARK_MASTER_PORT=7077

COPY submit.sh /

CMD ["/bin/bash", "/submit.sh"]
