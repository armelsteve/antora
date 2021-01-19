FROM node

RUN apt-get update -y
RUN npm i -g @antora/cli
RUN npm i -g @antora/site-generator-default
RUN apt-get install apache2 -y
RUN apt-get install git -y
COPY playbook.yml /tmp/
RUN antora --pull /tmp/playbook.yml
RUN rm -rf /var/www/html/index.html
RUN cp -r /tmp/build/site/* /var/www/html/

CMD ["apachectl","-D","FOREGROUND"]