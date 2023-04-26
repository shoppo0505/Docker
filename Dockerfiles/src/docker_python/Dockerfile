FROM python
#FROM docker.registry.clouddev.sogou:5000/online/test-xyz:3
## 容器内的工作目录
#WORKDIR /app
## copy 源代码到容器
#COPY hello_world.py /app
#RUN ls /app
#CMD ["python", "hello_world.py"]

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo deb  http://mirrors.ustc.edu.cn/debian/ stretch main non-free contrib >/etc/apt/sources.list && \
    echo deb-src  http://mirrors.ustc.edu.cn/debian/ stretch main non-free contrib >>/etc/apt/sources.list && \
    echo deb  http://mirrors.ustc.edu.cn/debian-security stretch/updates main >>/etc/apt/sources.list && \
    echo deb-src  http://mirrors.ustc.edu.cn/debian-security stretch/updates main >>/etc/apt/sources.list && \
    echo deb  http://mirrors.ustc.edu.cn/debian/ stretch-updates main non-free contrib >>/etc/apt/sources.list && \
    echo deb-src  http://mirrors.ustc.edu.cn/debian/ stretch-updates main non-free contrib >>/etc/apt/sources.list && \
    echo deb  http://mirrors.ustc.edu.cn/debian/ stretch-backports main non-free contrib >>/etc/apt/sources.list && \
    echo deb-src  http://mirrors.ustc.edu.cn/debian/ stretch-backports main non-free contrib >>/etc/apt/sources.list


RUN apt-get update && apt-get -y install cron

WORKDIR /app
COPY hello_world.py /app
#CMD ["python", "hello_world.py"]

# Copy hello-cron file to the cron.d directory
COPY cornjob/hello-cron /etc/cron.d/hello-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Apply cron job
RUN crontab /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
