FROM debian
RUN apt-get update && apt-get install -y apache2 php && apt-get clean
RUN rm /var/www/html/index.html
COPY ./index.php /var/www/html/index.php
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD ["apache2ctl", "-D", "FOREGROUND"]