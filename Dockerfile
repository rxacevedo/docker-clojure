FROM clojure:lein-2.5.1
MAINTAINER Roberto Acevedo "rxacevedo@fastmail.com"

ENV PORT=80 LEIN_REPL_PORT=4001

# If you want, comment out to create a very unsecure SSH server for TRAMP mode, etc
# RUN apt-get update && \
#     apt-get install -y openssh-server
# RUN sed -i 's/\(PermitRootLogin\).*/\1 yes/' /etc/ssh/sshd_config && \
#     /etc/init.d/ssh restart

EXPOSE 80 4001
EXPOSE 22

# Add profiles
RUN curl -o ~/.lein/profiles.clj https://raw.githubusercontent.com/rxacevedo/.lein/master/profiles.clj

ADD . /code
WORKDIR /code
RUN ["lein", "deps"]

# environ is used in the app itself to grab $PORT so that we don't have to invoke 
# 'lein run' in a shell process
ENTRYPOINT ["lein"]
CMD ["run"]
