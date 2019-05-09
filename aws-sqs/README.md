# AWS Kinesis via SQS-Local

Link: https://hub.docker.com/r/roribio16/alpine-sqs

Simple docker-compose template to deploy a local implementation of Amazon's SQS service.

The templates stored in this repository are not meant to be running directly from this repository. Instead these templates should be copied
into your project/application repository and used as a building block to build out a local environment (application + infrastructure) required
to run your application.

## Requirements
- - - -

  - [Docker for Mac](https://download.docker.com/mac/stable/Docker.dmg)
  - [Docker for Windows](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

## Usage
- - - -

The following section contains examples on how to start and interact with the SQS service.

#### Start SQS service:
- - - -

```bash
docker-compose [-d] up

Creating network "aws-sqs_sqs" with driver "bridge"
Creating aws-sqs_sqs_1  ... done
Creating aws-sqs_init_1 ... done
Attaching to aws-sqs_init_1, aws-sqs_sqs_1
sqs_1   | 2019-05-09 21:04:22,363 INFO Included extra file "/etc/supervisor/conf.d/elasticmq.conf" during parsing
sqs_1   | 2019-05-09 21:04:22,363 INFO Included extra file "/etc/supervisor/conf.d/insight.conf" during parsing
sqs_1   | 2019-05-09 21:04:22,363 INFO Included extra file "/etc/supervisor/conf.d/sqs-init.conf" during parsing
sqs_1   | 2019-05-09 21:04:22,363 INFO Set uid to user 0 succeeded
sqs_1   | 2019-05-09 21:04:22,371 INFO RPC interface 'supervisor' initialized
sqs_1   | 2019-05-09 21:04:22,371 CRIT Server 'unix_http_server' running without any HTTP authentication checking
sqs_1   | 2019-05-09 21:04:22,372 INFO supervisord started with pid 1
sqs_1   | 2019-05-09 21:04:23,375 INFO spawned: 'sqs-init' with pid 7
sqs_1   | 2019-05-09 21:04:23,378 INFO spawned: 'elasticmq' with pid 8
sqs_1   | 2019-05-09 21:04:23,380 INFO spawned: 'insight' with pid 9
sqs_1   | cp: can't stat '/opt/custom/*.conf': No such file or directory
sqs_1   |
sqs_1   | > sqs-insight@0.3.0 start /opt/sqs-insight
sqs_1   | > node index.js
sqs_1   |
sqs_1   | 21:04:24.086 [main] INFO  org.elasticmq.server.Main$ - Starting ElasticMQ server (0.14.6) ...
sqs_1   | Loading config file from "/opt/sqs-insight/lib/../config/config_local.json"
sqs_1   | 2019-05-09 21:04:24,386 INFO success: sqs-init entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
sqs_1   | 2019-05-09 21:04:24,386 INFO success: elasticmq entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
sqs_1   | 2019-05-09 21:04:24,387 INFO success: insight entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
sqs_1   | 2019-05-09 21:04:24,388 INFO exited: sqs-init (exit status 0; expected)
sqs_1   | Unable to load queues for  undefined
sqs_1   | Config contains 0 queues.
sqs_1   | 21:04:24.825 [elasticmq-akka.actor.default-dispatcher-2] INFO  akka.event.slf4j.Slf4jLogger - Slf4jLogger started
sqs_1   | listening on port 9325
sqs_1   | 21:04:25.960 [elasticmq-akka.actor.default-dispatcher-4] INFO  o.e.rest.sqs.TheSQSRestServerBuilder - Started SQS rest server, bind address 0.0.0.0:9324, visible server address * (depends on incoming request path)
sqs_1   | 21:04:26.067 [elasticmq-akka.actor.default-dispatcher-4] INFO  o.elasticmq.actor.QueueManagerActor - Creating queue QueueData(default,MillisVisibilityTimeout(10000),PT5S,PT0S,2019-05-09T21:04:25.972Z,2019-05-09T21:04:25.972Z,None,false,false,None,None,Map())
sqs_1   | 21:04:26.100 [main] INFO  org.elasticmq.server.Main$ - === ElasticMQ server (0.14.6) started in 2607 ms ===
init_1  | Creating queue queue1 @ http://sqs:9324
sqs_1   | 21:04:29.512 [elasticmq-akka.actor.default-dispatcher-4] INFO  o.elasticmq.actor.QueueManagerActor - Creating queue QueueData(queue1,MillisVisibilityTimeout(0),PT0S,PT0S,2019-05-09T21:04:29.506Z,2019-05-09T21:04:29.506Z,None,false,false,None,None,Map())
init_1  | {
init_1  |     "QueueUrl": "http://sqs:9324/queue/queue1"
init_1  | }
init_1  | Creating queue queue2 @ http://sqs:9324
sqs_1   | 21:04:29.981 [elasticmq-akka.actor.default-dispatcher-2] INFO  o.elasticmq.actor.QueueManagerActor - Creating queue QueueData(queue2,MillisVisibilityTimeout(30000),PT0S,PT0S,2019-05-09T21:04:29.980Z,2019-05-09T21:04:29.980Z,None,false,false,None,None,Map())
init_1  | {
init_1  |     "QueueUrl": "http://sqs:9324/queue/queue2"
init_1  | }
init_1  | Writing message to queue queue1 @ http://sqs:9324
init_1  | http://sqs:9324/queue/queue1
init_1  | {
init_1  |     "MD5OfMessageBody": "7f3cbfd49f490ac4df4452110e8dedcf",
init_1  |     "MD5OfMessageAttributes": "d41d8cd98f00b204e9800998ecf8427e",
init_1  |     "MessageId": "61e2d0e1-3a1b-478e-ba3b-c50bb3d5742b"
init_1  | }
init_1  | Writing message to queue queue2 @ http://sqs:9324
init_1  | http://sqs:9324/queue/queue2
init_1  | {
init_1  |     "MD5OfMessageBody": "7f3cbfd49f490ac4df4452110e8dedcf",
init_1  |     "MD5OfMessageAttributes": "d41d8cd98f00b204e9800998ecf8427e",
init_1  |     "MessageId": "1cb31ae9-806d-48e2-9fe5-8951fcdeb753"
init_1  | }



sqs_1   | Adding consumer for queue2
sqs_1   | Adding consumer for queue1
sqs_1   | Adding consumer for default
sqs_1   | 21:05:01.602 [elasticmq-akka.actor.default-dispatcher-2] INFO  org.elasticmq.actor.queue.QueueActor - queue1: Clearing queue
sqs_1   | 21:05:02.137 [elasticmq-akka.actor.default-dispatcher-14] INFO  org.elasticmq.actor.queue.QueueActor - queue2: Clearing queue
```

#### Verify SQS service is running:
- - - -

```bash
docker-compose ps

     Name                   Command               State                       Ports
--------------------------------------------------------------------------------------------------------
aws-sqs_init_1   /app/create_queue.sh             Up
aws-sqs_sqs_1    /usr/bin/supervisord -n -c ...   Up      0.0.0.0:9324->9324/tcp, 0.0.0.0:9325->9325/tcp
```

#### List SQS streams:
- - - -

```bash
› AWS_ACCESS_KEY_ID=x AWS_SECRET_ACCESS_KEY=x aws --endpoint-url http://localhost:9324 sqs list-queues
{
    "QueueUrls": [
        "http://localhost:9324/queue/queue2",
        "http://localhost:9324/queue/queue1",
        "http://localhost:9324/queue/default"
    ]
}
```

#### Stop SQS service:
- - - -

```bash
docker-compose down

Stopping aws-sqs_sqs_1  ... done
Stopping aws-sqs_init_1 ... done
Removing aws-sqs_sqs_1  ... done
Removing aws-sqs_init_1 ... done
Removing network aws-sqs_sqs
```
