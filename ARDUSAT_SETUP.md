# AWS & Docker Setup for Ardusat Canvas Instance

## Create AWS box

### Security Group

In AWS console, create the following security group (if it doesn't already exist):

```
canvas-test-sg
  Custom TCP Rule  /  TCP  /  3000  /  0.0.0.0/0
  Custom TCP Rule  /  TCP  /  3000  /  ::/0
  SSH  /  TCP  /  22  /  0.0.0.0/0
  SSH  /  TCP  /  22  /  ::/0
```

### EC2 Instance

Next, launch an `m3.medium` EC2 instance (Canvas needs at lest 4G of memory):

- AMI: ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20170221 (ami-a58d0dc5)
- Security Group: `canvas-test-sg`
- SSH Keypair: `ardusat-dev-team`

## SSH to AWS box

ssh -i ~/.ssh/aws_us_west_2-ardusat-dev-team.pem ubuntu@ec2-54-69-33-184.us-west-2.compute.amazonaws.com

## Install Docker

sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-get install -y docker-engine git-core

[Setup Instruction Source](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

# Install Canvas

```
git clone git@github.com:ArduSat/canvas-docker.git
cd canvas-docker

docker build -t ardusat/canvas .

sudo docker run -d --name=canvas -p 3000:3000 -e EMAIL_DELIVERY_METHOD=smtp -e SMTP_ADDRESS=smtp.mandrillapp.com -e SMTP_PORT=587 -e SMTP_USER=<MANDRILL_USER> -e SMTP_PASS=<MANDRILL_API_KEY> ardusat/canvas
```

Note: get the MANDRILL_USER and MANDRILL_API_KEY from app config, such as `heroku config -a ardusat-lessons`

[Original Dockerized Canvas](https://hub.docker.com/r/lbjay/canvas-docker/)
[Our Upgraded Dockerized Canvas](https://github.com/ArduSat/canvas-docker)


# Load it up in a browser

http://54.69.33.184:3000

# Login

canvas@example.edu / canvas
