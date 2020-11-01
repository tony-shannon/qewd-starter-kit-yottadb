FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
 && apt-get install -y \
  build-essential \
  libtinfo5 \
  libssl-dev \
  dos2unix \
  wget \
  gzip \
  openssh-server \
  curl \
  python2-minimal \
  libelf1 \
  locate \
  nano \
  subversion




# Create app directory
RUN mkdir /tmp/tmp1 \
&& wget -P /tmp/tmp1 https://gitlab.com/YottaDB/DB/YDB/raw/master/sr_unix/ydbinstall.sh
RUN cd /tmp/tmp1 \
&& pwd \
&& ls \
&& head -10 ydbinstall.sh \
&& chmod +x ydbinstall.sh \
&& ./ydbinstall.sh --utf8 default --verbose
&& source /usr/local/lib/yottadb/r130/ydb_env_set


USER gitpod
RUN cd ~
