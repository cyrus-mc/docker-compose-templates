#!/bin/bash

# for debugging purposes only
#set -x

trap cleanup 1 2 3 6
cleanup() {
  echo "list existing streams: "
  aws --endpoint-url=$ENDPOINT kinesis list-streams
  exit 0
}

# print set environment variables
env

STREAMS=${KINESIS_STREAMS:-ontime}
ENDPOINT=${KINESIS_ENDPOINT_URL:-http://localhost:4567/}

# wait for kinesalite to start up
until aws --endpoint-url=$ENDPOINT kinesis list-streams 2>&1 > /dev/null; do
  >&2 echo "kinesis is unavailable - sleeping"
  sleep 1
done

IFS=";"
# if we get here kinesis should be running, so create our stream(s)
for stream in $STREAMS; do
  echo "Creating stream ${stream} @ ${ENDPOINT}"
  aws --endpoint-url ${ENDPOINT} kinesis create-stream --stream-name=${stream} --shard-count=1
done
