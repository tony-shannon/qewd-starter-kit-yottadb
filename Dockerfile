FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
 && apt-get install -y build-essential 

# Create app directory
RUN mkdir /tmp/tmp1
RUN wget -P /tmp/tmp1 https://gitlab.com/YottaDB/DB/YDB/raw/master/sr_unix/ydbinstall.sh
RUN cd /tmp/tmp1
RUN pwd 
RUN ls
RUN head -10 ydbinstall.sh
RUN chmod +x ydbinstall.sh
RUN ./ydbinstall.sh --utf8 default --verbose
RUN source /usr/local/lib/yottadb/r130/ydb_env_set


USER gitpod
RUN cd ~
