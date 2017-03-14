FROM lbjay/canvas-docker

MAINTAINER Duane Johnson <duane@ardusat.com>

COPY assets/outgoing_mail.yml /opt/canvas/canvas-lms/config/outgoing_mail.yml
COPY assets/domain.yml /opt/canvas/canvas-lms/config/domain.yml

COPY assets/setenv.sh /opt/canvas/setenv.sh
COPY assets/shell.sh /opt/canvas/shell.sh
COPY assets/start.sh /opt/canvas/start.sh

RUN chmod +x /opt/canvas/setenv.sh
RUN chmod +x /opt/canvas/shell.sh
RUN chmod +x /opt/canvas/start.sh

CMD ["/opt/canvas/start.sh"]
