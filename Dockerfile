FROM node:alpine

RUN apt-get update && apt-get install -y \
  build-essential 

# Create app directory
RUN mkdir /tmp/tmp
RUN wget -P /tmp/tmp https://gitlab.com/YottaDB/DB/YDB/raw/master/sr_unix/ydbinstall.sh
RUN cd /tmp/tmp
RUN chmod +x ydbinstall.sh
RUN ./ydbinstall.sh --utf8 default --verbose
RUN source /usr/local/lib/yottadb/r130/ydb_env_set
RUN cd ~

