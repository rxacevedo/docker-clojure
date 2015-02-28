# Set up a display-forwarding session from the Docker container to XQuartz

open -a XQuartz &
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
docker build -t="rxacevedo/clojure-env" .
docker run -i -t -e DISPLAY=192.168.59.3:0 rxacevedo/clojure-env
