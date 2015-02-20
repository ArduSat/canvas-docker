# canvas-docker

## Overview

**docker-canvas** aims to provide a simple, disposable, containerized Canvas instance for fast(ish) integration testing of LTI applications.

## Prerequisites

* [docker](https://www.docker.com/) (developed & tested w/ v1.4.1)
* [fig](http://fig.sh) (requires python >= 2.7, docker >= 1.3)

## Quick Start

1. Clone this repo somewhere. 
2. Why would you not create and activate a virtualenv?
3. `pip install -r requirements.txt`
4. Build the image: `docker build -t canvas-docker .`
5. Start the container: `docker run -t -i -p 3000 --name canvas-docker canvas-docker`
6. Point your browser to [http://localhost:3000](http://localhost:3000). The admin user/pass login is `canvas@example.edu` / `canvas`.

## The "fat" container

The `Dockerfile` and associated build scripts create a resulting docker image where all necessary services of the Canvas instance are run within a single container. This approach is sometimes called a "fat" container. This admittedly goes against the "Docker Philosophy" of *one concern per container*, but for the intended purposes of the image it offers a couple of advantages, chief among them, faster spin-up times. The functionality focus is on creating a tool for integration testing of external (LTI) apps, not general canvas development, scalability, or, god forbid, actual deployment.

## Details

* The resulting canvas image is built and run using `RAILS_ENV=development`. At some point I might try creating a separate "production" flavor, but, because docker doesn't allow the setting of build-time variables except in the `Dockerfile`, it would require a separate `Dockerfile`. Also, when I did try building with `RAILS_ENV=production`, the resulting instance had issues with routing errors to the compiled assets, and the `db:initial_setup` rake task threw lots of warnings about missing triggers (?). So that.
* Everything is currently somewhat "opinionated" in that things that would be nice to have configurable are hard-coded, e.g., postgres and canvas usernames, postgres network settings, path to the postgres data, etc.
* The `Dockerfile` process mostly follows Canvas's [Quick Start](https://github.com/instructure/canvas-lms/wiki/Quick-Start) guidelines with a few exeptions:
    * as mentioned above, `RAILS_ENV=development`
    * redis is installed, configured and used
    * the `delated_job` background task is executed
    * postgres is configured to not require a password for local connections, or for connections originating within a network defined by Docker's default network bridge setup: 172.17.0.0/16.
    * everything is executed as root. This is me being lazy and I hope to fix this by creating/using a `canvas` user at some point.
* 

## Contributors

* Jay Luker - [lbjay](https://github.com/lbjay)

## License

Apache 2.0

## Copyright

2015 President and Fellows of Harvard College
