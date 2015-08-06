FROM clojure:latest
MAINTAINER Roberto Acevedo "rxacevedo@fastmail.com"

ENV PORT=8080 LEIN_REPL_PORT=4001

# Ports
EXPOSE 8080 4001

WORKDIR /

# Add profiles
RUN lein new compojure app

WORKDIR /app

CMD ["lein", "ring", "server-headless"]
