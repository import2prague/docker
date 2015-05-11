FROM ubuntu:12.04

RUN apt-get update && apt-get install -y apache2 wget libapache2-mod-auth-mysql php5-mysql php5 libapache2-mod-php5 php5-mcrypt && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN rm /var/www/index.html
RUN wget -O /var/www/index.php http://downloads.sourceforge.net/adminer/adminer-4.2.1-mysql.php

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
