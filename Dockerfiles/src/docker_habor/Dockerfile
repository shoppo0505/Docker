FROM alpine:latest

WORKDIR /srv/harbor

# add inside repositories to speed up the installation
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

#download the harbor offline package from internet
COPY ./dockerfiles/harbor-offline-installer-v2.8.2.tgz /srv/harbor/harbor.tgz

#install plugins and extract the harbor package
RUN apk --no-cache add curl tar openssl docker docker-cli-compose fuse-overlayfs ncurses
RUN apk --no-cache add --update bash && rm -rf /var/cache/apk/*
RUN tar -xzf harbor.tgz && \
        mv harbor/* /srv/harbor/. && \
        rm -rf harbor.tgz harbor && \
        mkdir /etc/docker \

# add file for harbor
COPY ./dockerfiles/harbor.yml  /srv/harbor/
COPY ./dockerfiles/daemon.json /etc/docker/.

# start the docker processor
CMD dockerd --storage-driver fuse-overlayfs
#ENTRYPOINT ["./install.sh"]


#RUN chmod +x prepare
#RUN ./prepare
#
#COPY harbor.yml /data/
#COPY docker-compose.yml /srv/harbor/
#
#VOLUME ["/data"]
#
#EXPOSE 80 443 4443
#
#ENTRYPOINT ["/bin/sh"]
#
#CMD ["./start.sh"]
#ENTRYPOINT /bin/bash


#docker run -v /:/hostfs goharbor/prepare:v2.0.0 migrate --input /home/dengq/upgrade/harbor-19.yml --output /home/dengq/upgrade/harbor-20.yml --target 2.0.0
