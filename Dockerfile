FROM jenkins/jnlp-slave
MAINTAINER ahung06

USER root
RUN echo "deb http://deb.debian.org/debian testing main" \
>> /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        python3.7 \
        python3-pip

USER jenkins
RUN python3.7 -m pip install --upgrade pip
RUN python3.7 -m pip install --user setuptools twine

ENTRYPOINT ["jenkins-slave"]
