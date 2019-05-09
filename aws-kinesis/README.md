# AWS Kinesis via Kinesalite

Simple docker-compose template to deploy a local implementation of Amazon's Kinesis service.

The templates stored in this repository are not meant to be running directly from this repository. Instead these templates should be copied
into your project/application repository and used as a building block to build out a local environment (application + infrastructure) required
to run your application.

## Requirements
- - - -

  - [Docker for Mac](https://download.docker.com/mac/stable/Docker.dmg)
  - [Docker for Windows](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

## Usage
- - - -

The following section contains examples on how to start and interact with the Kinesis service.

#### Start Kinesis service:
- - - -

```bash
docker-compose [-d] up

Creating network "aws-kinesis_sqs" with driver "bridge"
Creating aws-kinesis_kinesis_1 ... done
Creating aws-kinesis_init_1    ... done
Attaching to aws-kinesis_kinesis_1, aws-kinesis_init_1
init_1     | LANG=C.UTF-8
init_1     | HOSTNAME=11309d329339
init_1     | AWS_SECRET_ACCESS_KEY=x
init_1     | GPG_KEY=0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
init_1     | AWS_DEFAULT_REGION=us-west-2
init_1     | KINESIS_STREAMS=stream1;stream2
init_1     | PWD=/app
init_1     | HOME=/root
init_1     | DIR=/app
init_1     | PYTHON_VERSION=3.7.3
init_1     | AWS_ACCESS_KEY_ID=x
init_1     | SHLVL=1
init_1     | PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
init_1     | PYTHON_PIP_VERSION=19.1.1
init_1     | KINESIS_ENDPOINT_URL=http://kinesis:4567/
init_1     | _=/usr/bin/env
kinesis_1  | Listening at http://:::4567
init_1     | Creating stream stream1 @ http://kinesis:4567/
init_1     | Creating stream stream2 @ http://kinesis:4567/
aws-kinesis_init_1 exited with code 0
```

#### Verify Kinesis service is running:
- - - -

```bash
docker-compose ps

› docker-compose ps
        Name                       Command               State            Ports
----------------------------------------------------------------------------------------
aws-kinesis_init_1      /app/create_stream.sh            Exit 0
aws-kinesis_kinesis_1   /tini -- /usr/src/app/node ...   Up       0.0.0.0:4567->4567/tcp
```

#### List Kinesis streams:
- - - -

```bash
› AWS_ACCESS_KEY_ID=x AWS_SECRET_ACCESS_KEY=x aws --endpoint-url http://localhost:4567/ kinesis list-streams
{
    "StreamNames": [
        "stream1",
        "stream2"
    ]
}
```

#### Stop Kinesis service:
- - - -

```bash
docker-compose down

Stopping aws-kinesis_kinesis_1 ... done
Removing aws-kinesis_init_1    ... done
Removing aws-kinesis_kinesis_1 ... done
Removing network aws-kinesis_sqs
```
