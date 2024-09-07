#!/bin/bash

# Set SPARK_HOME directory
export SPARK_HOME=/spark

# Source Spark configuration and environment files
. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

# Create the worker logs directory if it doesn't exist
mkdir -p $SPARK_WORKER_LOG

# Redirect Spark worker log to stdout for easier log management
ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

# Start the Spark worker service
/spark/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG/spark-worker.out &

# Keep the container alive by following the log output
tail -f $SPARK_WORKER_LOG/spark-worker.out
