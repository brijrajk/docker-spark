FROM spark-base:3.5.1-hadoop3

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY master.sh /

RUN chmod +x /master.sh
RUN ln -sf /usr/bin/python3 /usr/local/bin/python

ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER_WEBUI_PORT=8080
ENV SPARK_MASTER_LOG=/spark/logs

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/master.sh"]
