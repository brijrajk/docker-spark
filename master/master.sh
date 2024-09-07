#!/bin/bash

# Set SPARK_MASTER_HOST to the container's hostname if not provided
export SPARK_MASTER_HOST=${SPARK_MASTER_HOST:-`hostname`}

# Set SPARK_HOME directory
export SPARK_HOME=/spark

# Source Spark configuration and environment files
. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

# Create the logs directory if it doesn't exist
mkdir -p $SPARK_MASTER_LOG

# Redirect Spark master log to stdout for easier log management
ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

# Start the Spark master service
cd /spark/bin && /spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out &

# Keep the container alive by following the log output
tail -f $SPARK_MASTER_LOG/spark-master.out
