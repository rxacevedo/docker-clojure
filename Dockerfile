FROM clojure:latest
MAINTAINER Roberto Acevedo "rxacevedo@fastmail.com"

WORKDIR /

# Add profiles
RUN lein new app app

WORKDIR /app

CMD ["lein", "repl"]
