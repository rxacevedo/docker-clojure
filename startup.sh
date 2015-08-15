# Set up a display-forwarding session from the Docker container to XQuartz

open -a XQuartz &
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &

docker build -t rxacevedo/clojure-env-docker . && \
docker run -e DISPLAY=192.168.99.100:0 \
           -e LEIN_REPL_HOST=0.0.0.0 \
           -e LEIN_REPL_PORT=4001 \
           -p 4001:4001 \
           -it rxacevedo/docker-clojure
