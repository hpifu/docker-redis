FROM centos:centos7
RUN yum install -y kde-l10n-Chinese && yum reinstall -y glibc-common && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 
RUN yum install -y epel-release
RUN yum install -y docker-io
RUN yum install -y go
RUN yum install -y make
RUN yum install -y wget
RUN wget http://download.redis.io/releases/redis-5.0.7.tar.gz && \
    tar -xzvf redis-5.0.7.tar.gz && \
    cd redis-5.0.7 && \
    make -j8 && \
    make install

COPY redis.conf /usr/local/etc/redis/redis.conf
USER root
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
