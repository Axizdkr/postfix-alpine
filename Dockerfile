FROM alpine:3.6

RUN	true && \
	apk add --no-cache --update postfix ca-certificates supervisor rsyslog bash python3 && \
	(rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

COPY	supervisord.conf /etc/supervisord.conf
COPY	rsyslog.conf /etc/rsyslog.conf
COPY	postfix.sh /postfix.sh
RUN	chmod +x /postfix.sh
RUN	touch /var/log/cron.log

USER	root
WORKDIR	/tmp

EXPOSE 587
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]