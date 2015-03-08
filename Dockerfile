FROM ubuntu:latest
MAINTAINER Roberto Acevedo "rxacevedo@fastmail.com"
ENV REFRESHED_AT 2015-03-08:14:26

# Get some dependencies for buliding the environment
RUN apt-get update && \
    apt-get install -y build-essential curl git openjdk-7-jdk maven

# Set up emacs
WORKDIR /usr/tmp
RUN apt-get build-dep -y emacs24
RUN curl -O http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz && \
    tar -xzvf emacs-24.4.tar.gz && \
    rm emacs-24.4.tar.gz && \
    cd emacs-24.4 && \
    ./configure --prefix=/opt/emacs && \
    make && \
    make install
RUN curl -O http://download-cf.jetbrains.com/idea/ideaIU-14.0.3.tar.gz && \
    tar -zxvf ideaIU-14.0.3.tar.gz && \
    mv idea-IU-139.1117.1/ /opt/idea
 
# Set up leiningen
WORKDIR /usr/bin/
RUN curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
    chmod +x lein && \
    lein

# Pull down emacs config
RUN git clone https://github.com/rxacevedo/emacs.d.git ~/.emacs.d/

# Pull down leiningen config/profile
RUN curl -o ~/.lein/profiles.clj https://raw.githubusercontent.com/rxacevedo/.lein/master/profiles.clj 
ENV LEIN_ROOT=true
RUN mkdir -p ~/code/clojure/ && \
    cd ~/code/clojure && \
    lein new app hacking && \
    cd ~/code/clojure/hacking && \
    lein deps

# Put emacs on the path
ENV PATH /opt/emacs/bin:/opt/idea/bin:$PATH

# Do some work
WORKDIR /root/code
