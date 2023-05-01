FROM ubuntu:22.04

LABEL maintainer: Kot Sylwester

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /opt/mbaro
COPY requirements.txt /opt/mbaro/

RUN apt-get update && apt-get install -y git && apt-get install wget

RUN pip3 install -r /opt/mbaro/requirements.txt

COPY mocho_baro.py /opt/mbaro
COPY r.sh /opt/mbaro/

RUN chmod +x /opt/mbaro/r.sh

CMD ["/opt/mbaro/r.sh"]

