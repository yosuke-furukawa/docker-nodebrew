FROM ubuntu
MAINTAINER Yosuke FURUKAWA

# make apt-get latest and install curl and git
RUN apt-get update
RUN apt-get install -y --force-yes wget curl git python

# Set working directory.
ENV HOME /root
WORKDIR /root

# install nodebrew
RUN wget git.io/nodebrew
RUN sudo -uroot chown root nodebrew
RUN sudo -uroot perl nodebrew setup
ENV PATH $HOME/.nodebrew/current/bin:$PATH
RUN echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.bashrc
RUN sudo -uroot nodebrew install-binary latest
RUN sudo -uroot nodebrew install-binary stable
RUN sudo -uroot nodebrew install-binary 0.8
