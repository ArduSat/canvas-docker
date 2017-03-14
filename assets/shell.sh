#!/bin/bash

set -e

sed -i "s/EMAIL_DELIVERY_METHOD/${EMAIL_DELIVERY_METHOD-test}/" /opt/canvas/canvas-lms/config/outgoing_mail.yml
sed -i "s/SMTP_ADDRESS/${SMTP_ADDRESS-localhost}/" /opt/canvas/canvas-lms/config/outgoing_mail.yml
sed -i "s/SMTP_PORT/${SMTP_PORT-25}/" /opt/canvas/canvas-lms/config/outgoing_mail.yml
sed -i "s/SMTP_USER/${SMTP_USER-}/" /opt/canvas/canvas-lms/config/outgoing_mail.yml
sed -i "s/SMTP_PASS/${SMTP_PASS-}/" /opt/canvas/canvas-lms/config/outgoing_mail.yml

sed -i "s/CANVAS_OUTGOING_ADDRESS/${CANVAS_OUTGOING_ADDRESS-canvas@example.edu}/" /opt/canvas/canvas-lms/config/outgoing_mail.yml
sed -i "s/CANVAS_DOMAIN/${CANVAS_DOMAIN-example.edu}/" /opt/canvas/canvas-lms/config/outgoing_mail.yml

bash -il
