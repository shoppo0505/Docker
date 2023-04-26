FROM docker.io/library/nginx:latest
#EXPOSE 1433
#RUN chmod 777 /var/lib/dpkg/lock-frontend
RUN apt-get update && apt-get install net-tools
COPY nginx.conf /etc/nginx
#RUN touch /etc/nginx/logs
RUN touch /var/log/nginx/host.access.log
