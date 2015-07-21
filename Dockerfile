FROM clojure:lein-2.5.1
MAINTAINER Roberto Acevedo "rxacevedo@fastmail.com"

ENV PORT=80 LEIN_REPL_PORT=4001

# Required by Incanter
RUN apt-get update && \
    apt-get install -y git libgfortran3

# Ports
EXPOSE 80 4001

# Add profiles
RUN curl -o ~/.lein/profiles.clj https://raw.githubusercontent.com/rxacevedo/.lein/master/profiles.clj
RUN mkdir /code && \
          git clone https://github.com/rxacevedo/webapp-base.git /code

WORKDIR /code
RUN ["lein", "deps"]

ENTRYPOINT ["lein"]
CMD ["repl"]
