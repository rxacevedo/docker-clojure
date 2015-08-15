[![Stories in Ready](https://badge.waffle.io/rxacevedo/docker-clojure.png?label=ready&title=Ready)](https://waffle.io/rxacevedo/docker-clojure)
# docker-clojure

A containzerized Clojure dev environment.

## Prerequisites

You will need [Docker][] 1.5.0 or above, since that's what I built this against. You will also need [VirtualBox][] to create a Docker host via [Docker Machine][] if you don't already have one set up.

### Mac
If you have [Homebrew][] and [Homebrew Cask][], you can install all the pre-requisites like so:   

`brew install docker docker-machine && brew cask install virtualbox`

[docker]: https://www.docker.com
[docker machine]: https://github.com/docker/machine
[virtualbox]: https://www.virtualbox.org
[homebrew]: http://brew.sh
[homebrew cask]: http://caskroom.io

Then create a VM with a Docker engine:

`docker-machine create -d virtualbox -d`

Finally, set your environment variabels so that `docker` knows where the Docker engine resides:

`eval "$(docker-machine env dev)"`

## Running

- With Docker CLI: 

```
docker build -t rxacevedo/docker-clojure . && \
docker run -it rxacevedo/docker-clojure
```

This will start a REPL session in the container. If you'd like to hook into it via Emacs/CIDER, you'll need to add this option to the `project.clj` file first:

`:repl-options {:host "0.0.0.0"}`

This will cause the REPL server in the container to listen on all configured NICs instead of just the loopback interface (localhost). You can do this by overriding the `CMD` instruction in the `Dockerfile` like this:

`docker run -it -p 4001:4001 -e LEIN_REPL_PORT=4001 rxacevedo/docker-clojure /bin/bash`

Then just edit the file (you'll probably need to install a text editor such as `vim`) and you're good to go.

## License

I don't own any of this.
