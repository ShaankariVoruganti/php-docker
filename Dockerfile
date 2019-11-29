FROM ubuntu:latest

MAINTAINER Melvis Ringnyu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y php7.2 libapache2-mod-php7.2 apache2

#Enable apache mods
RUN a2enmod php7.2

#Update the PHP.ini file, enable <? ?> tags and quieten logging
RUN sed -i -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.2/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.2/apache2/php.ini

COPY index.php /var/www/html/

CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
