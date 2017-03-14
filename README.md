# canvas-docker

## Overview


## Prerequisites

* [docker](https://www.docker.com/) (developed & tested w/ v17)

On Ubuntu:

```
sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-get install -y docker-engine git-core
```

## Building & Running

```
git clone https://github.com/ArduSat/canvas-docker.git
cd canvas-docker
docker build -t ardusat/canvas-docker .
docker run --name canvas -p 80:3000 -d \
  -e EMAIL_DELIVERY_METHOD=smtp \
  -e SMTP_ADDRESS=smtp.mandrillapp.com \
  -e SMTP_PORT=587 \
  -e SMTP_USER=<user> \
  -e SMTP_PASS=<pass> \
  -e CANVAS_OUTGOING_ADDRESS=<email> \
  -e CANVAS_DOMAIN=<domain> \
  ardusat/canvas-docker
```


## Default developer_key & API access token

The image build includes the injection of default `developer_key` and `access_token` entries into the database. 

* **developer key**: test_developer_key
* **access token**: canvas-docker

API requests should be possible, e.g.,

`curl -H "Authorization: Bearer canvas-docker" http://localhost:3000/api/v1/courses`

The developer key is for use with Canvas's [OAuth2 Token Request Flow](https://canvas.instructure.com/doc/api/file.oauth.html)

## Outgoing Email

By default the instance's outgoing email `delivery_method` will be set to "test", meaning outgoing emails, such as user registration messages, will be 
sent to the container's stdout. 

To configure 'smtp' delivery set the following $ENV values at runtime:

* **EMAIL_DELIVERY_METHOD** (set this to "smtp")
* **SMTP_ADDRESS**
* **SMTP_PORT**
* **SMTP_USER**
* **SMTP_PASS**
* **CANVAS_OUTGOING_ADDRESS**
* **CANVAS_DOMAIN**

Example using [Mandrill](https://mandrillapp.com/):

```
docker run -d --name=canvas -p 3000:3000 \
  -e EMAIL_DELIVERY_METHOD=smtp \
  -e SMTP_ADDRESS=smtp.mandrillapp.com \
  -e SMTP_PORT=587 \
  -e SMTP_USER=<mandrill_user> \
  -e SMTP_PASS=<mandrill_api_key> \
  ardusat/canvas-docker
```

## Contributors

* Jay Luker - [lbjay](https://github.com/lbjay)
* Duane Johnson

## License

Apache 2.0

## Copyright

2016 President and Fellows of Harvard College
