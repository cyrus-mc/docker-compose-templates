# AWS DynamoDb via DynamoDb local

Simple docker-compose template to deploy a local implementation of Amazon's DynamoDb service.

The templates stored in this repository are not meant to be running directly from this repository. Instead these templates should be copied
into your project/application repository and used as a building block to build out a local environment (application + infrastructure) required
to run your application.

## Requirements
- - - -

  - [Docker for Mac](https://download.docker.com/mac/stable/Docker.dmg)
  - [Docker for Windows](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

## Usage
- - - -

The following section contains examples on how to start and interact with the DynamoDb service.

#### Start DynamoDb service:
- - - -

```bash
docker-compose [-d] up

Creating network "aws-dynamodb_dynamodb" with driver "bridge"
Creating aws-dynamodb_dynamodb_1 ... done
Creating aws-dynamodb_init_1     ... done
Attaching to aws-dynamodb_init_1, aws-dynamodb_dynamodb_1
init_1      | LANG=C.UTF-8
init_1      | HOSTNAME=3dda4952f09e
init_1      | DYNAMODB_ENDPOINT_URL=http://dynamodb:8000
init_1      | AWS_SECRET_ACCESS_KEY=x
init_1      | GPG_KEY=0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
init_1      | AWS_DEFAULT_REGION=us-west-2
init_1      | PWD=/app
init_1      | HOME=/root
init_1      | DIR=/app
init_1      | DYNAMODB_TABLES=table1;table2
init_1      | PYTHON_VERSION=3.7.3
init_1      | AWS_ACCESS_KEY_ID=x
init_1      | SHLVL=1
init_1      | PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
init_1      | PYTHON_PIP_VERSION=19.1.1
init_1      | _=/usr/bin/env
dynamodb_1  | Initializing DynamoDB Local with the following configuration:
dynamodb_1  | Port:     8000
dynamodb_1  | InMemory: true
dynamodb_1  | DbPath:   null
dynamodb_1  | SharedDb: false
dynamodb_1  | shouldDelayTransientStatuses:     false
dynamodb_1  | CorsParams:       *
dynamodb_1  |
init_1      | Creating table table1 @ http://dynamodb:8000
init_1      | {
init_1      |     "TableDescription": {
init_1      |         "AttributeDefinitions": [
init_1      |             {
init_1      |                 "AttributeName": "id",
init_1      |                 "AttributeType": "N"
init_1      |             },
init_1      |             {
init_1      |                 "AttributeName": "userId",
init_1      |                 "AttributeType": "N"
init_1      |             }
init_1      |         ],
init_1      |         "TableName": "table1",
init_1      |         "KeySchema": [
init_1      |             {
init_1      |                 "AttributeName": "id",


Creating network "aws-dynamodb_dynamodb" with driver "bridge"
Creating aws-dynamodb_dynamodb_1 ... done
Creating aws-dynamodb_init_1     ... done
Attaching to aws-dynamodb_init_1, aws-dynamodb_dynamodb_1
init_1      | LANG=C.UTF-8
init_1      | HOSTNAME=3dda4952f09e
init_1      | DYNAMODB_ENDPOINT_URL=http://dynamodb:8000
init_1      | AWS_SECRET_ACCESS_KEY=x
init_1      | GPG_KEY=0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
init_1      | AWS_DEFAULT_REGION=us-west-2
init_1      | PWD=/app
init_1      | HOME=/root
init_1      | DIR=/app
init_1      | DYNAMODB_TABLES=table1;table2
init_1      | PYTHON_VERSION=3.7.3
init_1      | AWS_ACCESS_KEY_ID=x
init_1      | SHLVL=1
init_1      | PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
init_1      | PYTHON_PIP_VERSION=19.1.1
init_1      | _=/usr/bin/env
dynamodb_1  | Initializing DynamoDB Local with the following configuration:
dynamodb_1  | Port:     8000
dynamodb_1  | InMemory: true
dynamodb_1  | DbPath:   null
dynamodb_1  | SharedDb: false
dynamodb_1  | shouldDelayTransientStatuses:     false
dynamodb_1  | CorsParams:       *
dynamodb_1  |
init_1      | Creating table table1 @ http://dynamodb:8000
init_1      | {
init_1      |     "TableDescription": {
init_1      |         "AttributeDefinitions": [
init_1      |             {
init_1      |                 "AttributeName": "id",
init_1      |                 "AttributeType": "N"
init_1      |             },
init_1      |             {
init_1      |                 "AttributeName": "userId",
init_1      |                 "AttributeType": "N"
init_1      |             }
init_1      |         ],
init_1      |         "TableName": "table1",
init_1      |         "KeySchema": [
init_1      |             {
init_1      |                 "AttributeName": "id",

Creating network "aws-dynamodb_dynamodb" with driver "bridge"
Creating aws-dynamodb_dynamodb_1 ... done
Creating aws-dynamodb_init_1     ... done
Attaching to aws-dynamodb_init_1, aws-dynamodb_dynamodb_1
init_1      | LANG=C.UTF-8
init_1      | HOSTNAME=3dda4952f09e
init_1      | DYNAMODB_ENDPOINT_URL=http://dynamodb:8000
init_1      | AWS_SECRET_ACCESS_KEY=x
init_1      | GPG_KEY=0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
init_1      | AWS_DEFAULT_REGION=us-west-2
init_1      | PWD=/app
init_1      | HOME=/root
init_1      | DIR=/app
init_1      | DYNAMODB_TABLES=table1;table2
init_1      | PYTHON_VERSION=3.7.3
init_1      | AWS_ACCESS_KEY_ID=x
init_1      | SHLVL=1
init_1      | PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
init_1      | PYTHON_PIP_VERSION=19.1.1
init_1      | _=/usr/bin/env
dynamodb_1  | Initializing DynamoDB Local with the following configuration:
dynamodb_1  | Port:     8000
dynamodb_1  | InMemory: true
dynamodb_1  | DbPath:   null
dynamodb_1  | SharedDb: false
dynamodb_1  | shouldDelayTransientStatuses:     false
dynamodb_1  | CorsParams:       *
dynamodb_1  |
init_1      | Creating table table1 @ http://dynamodb:8000
init_1      | {
init_1      |     "TableDescription": {
init_1      |         "AttributeDefinitions": [
init_1      |             {
init_1      |                 "AttributeName": "id",
init_1      |                 "AttributeType": "N"
init_1      |             },
init_1      |             {
init_1      |                 "AttributeName": "userId",
init_1      |                 "AttributeType": "N"
init_1      |             }
init_1      |         ],
init_1      |         "TableName": "table1",
init_1      |         "KeySchema": [
init_1      |             {
init_1      |                 "AttributeName": "id",

...

init_1      | {
init_1      |     "UnprocessedItems": {}
init_1      | }

```

#### Verify DynamoDb service is running:
- - - -

```bash
> docker-compose ps

         Name                        Command               State            Ports
------------------------------------------------------------------------------------------
aws-dynamodb_dynamodb_1   java -jar DynamoDBLocal.ja ...   Up       0.0.0.0:8000->8000/tcp
aws-dynamodb_init_1       /app/create_table.sh             Exit 0
```

#### List DynamoDb tables:
- - - -

```bash
› AWS_ACCESS_KEY_ID=x AWS_SECRET_ACCESS_KEY=x aws --endpoint-url http://localhost:8000 dynamodb list-tables
{
    "TableNames": [
        "table1",
        "table2"
    ]
}
```

#### Stop DynamoDb tables:
- - - -

```bash
› docker-compose down

Stopping aws-dynamodb_dynamodb_1 ... done
Removing aws-dynamodb_init_1     ... done
Removing aws-dynamodb_dynamodb_1 ... done
Removing network aws-dynamodb_dynamodb
```
