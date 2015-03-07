FROM ubuntu:latest
MAINTAINER Roberto Acevedo "rxacevedo@fastmail.com"
ENV REFRESHED_AT 2015-03-01:20:30

# Get some dependencies for buliding the environment
RUN apt-get update && \
    apt-get install -y build-essential curl git openjdk-7-jdk

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
ENV PATH /opt/emacs/bin:$PATH

# Do some work
WORKDIR /root/code
