#!/bin/bash

# for debugging purposes only
#set -x

trap cleanup 1 2 3 6
cleanup() {
  echo "failed"
  #aws --endpoint-url=$SQS_ENDPOINT sqs delete-queue --queue-url $QUEUE_URL
  exit 0
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
QUEUES=${SQS_QUEUES:-example}
ENDPOINT=${SQS_ENDPOINT_URL:-http://localhost:9324}

# wait for sqs-local to start up
until aws --endpoint-url=$ENDPOINT sqs list-queues 2>&1 > /dev/null; do
  >&2 echo "local SQS is unavailable - sleeping"
  sleep 1
done

IFS=";"
# if we get here sqs should be running, so create our queue(s)
for queue in $QUEUES; do
  echo "Creating queue ${queue} @ ${ENDPOINT}"
  if [[ -f $DIR/${queue}-attributes.json ]]; then
    aws --endpoint-url ${ENDPOINT} sqs create-queue --queue-name $queue --attributes file://${DIR}/${queue}-attributes.json
  else
    aws --endpoint-url ${ENDPOINT} sqs create-queue --queue-name $queue
  fi
done

# now just write some random data to our queues
while true;
do
  DATE=`date`
  for queue in $QUEUES; do
    echo "Writing message to queue ${queue} @ ${ENDPOINT}"
    echo ${ENDPOINT}/queue/$queue
    aws --endpoint-url ${ENDPOINT} sqs send-message --queue-url ${ENDPOINT}/queue/$queue --message-body "Last update @ $DATE"
  done
  sleep 30

  # purge the queue(s)
  for queue in $QUEUES; do
    aws --endpoint-url ${ENDPOINT} sqs purge-queue --queue-url ${ENDPOINT}/queue/$queue
  done
done
