FROM freshrss/freshrss:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /var/www/FreshRSS
EXPOSE 80
CMD ([ -z "$CRON_MIN" ] || cron) && \
	. /etc/apache2/envvars && \
	exec apache2 -D FOREGROUND
