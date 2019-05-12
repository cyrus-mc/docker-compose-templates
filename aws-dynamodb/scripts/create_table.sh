#!/bin/bash

# for debugging purposes only
#set -x

trap cleanup 1 2 3 6
cleanup() {
  echo "list existing streams: "
  aws --endpoint-url=$ENDPOINT dynamodb list-tables
  exit 0
}

# print set environment variables
env

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

TABLES=${DYNAMODB_TABLES:-default}
ENDPOINT=${DYNAMODB_ENDPOINT_URL:-http://localhost:8000}

# wait for dynamodb to start up
until aws --endpoint-url=$ENDPOINT dynamodb list-tables 2>&1 > /dev/null; do
  >&2 echo "dynamodb is unavailable - sleeping"
  sleep 1
done

IFS=";"
# if we get here dynamodb should be running, so create our table(s)
for table in $TABLES; do
  echo "Creating table ${table} @ ${ENDPOINT}"
  aws --endpoint-url ${ENDPOINT} dynamodb create-table --table-name ${table} --attribute-definitions file://${DIR}/${table}-attributes.json --key-schema file://${DIR}/${table}-schema.json --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
done

# now populate our tables with some data
aws --endpoint-url=$ENDPOINT dynamodb batch-write-item --request-items file://${DIR}/batch-write-items.json
