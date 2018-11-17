#!/bin/bash

postconf -e smtputf8_enable=no
postalias /etc/postfix/aliases

#example
postconf -e append_dot_mydomain=no
postconf -e biff=no
postconf -e local_recipient_maps=
postconf -e mydomain=example.com
postconf -e myhostname=example.com
postconf -e mynetworks="127.0.0.1/32, 10.10.100.3, 10.20.102.3"
postconf -e message_size_limit=30720000
postconf -e mydestination=
postconf -e readme_directory=no
postconf -e smtpd_banner='$mydomain ESMTP postfix'
postconf -e relay_domains='$mydomain'

# Use 587 (submission)
sed -i -r -e 's/^#submission/submission/' /etc/postfix/master.cf

/usr/sbin/postfix -c /etc/postfix start
