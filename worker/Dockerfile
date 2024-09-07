FROM spark-base:3.5.1-hadoop3

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY worker.sh /

RUN chmod +x /worker.sh

RUN ln -sf /usr/bin/python3 /usr/local/bin/python

ENV SPARK_WORKER_WEBUI_PORT=8081
ENV SPARK_WORKER_LOG=/spark/logs
ENV SPARK_MASTER="spark://spark-master:7077"

EXPOSE 8081

CMD ["/bin/bash", "/worker.sh"]
