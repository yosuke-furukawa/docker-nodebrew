FROM ubuntu
MAINTAINER Yosuke FURUKAWA

# make apt-get latest and install curl and git
RUN apt-get update
RUN apt-get install -y --force-yes curl git

# install nodebrew
RUN curl -L git.io/nodebrew | perl - setup
ENV PATH $HOME/.nodebrew/current/bin:$PATH
RUN echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.bashrc
RUN nodebrew install-binary latest
RUN nodebrew install-binary stable
RUN nodebrew install-binary 0.8
