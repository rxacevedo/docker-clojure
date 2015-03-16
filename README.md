[![Stories in Ready](https://badge.waffle.io/rxacevedo/clojure-env-docker.png?label=ready&title=Ready)](https://waffle.io/rxacevedo/clojure-env-docker)
# clojure-env-docker

A containzerized Clojure dev environment.

## Prerequisites

You will need [Docker][] 1.5.0 or above, since that's what I built this against. [Docker compose][] is optional, but   makes startup a little easier. If you're on a Mac, you will also need [boot2docker][] and [VirtualBox][].

### Mac
If you have [Homebrew][] and [Homebrew Cask][], you can install all the pre-requisites like so:   

`brew install boot2docker docker docker-compose && brew cask install virtualbox`

[docker]: https://www.docker.com
[docker compose]: https://github.com/docker/compose/
[boot2docker]: http://boot2docker.io
[virtualbox]: https://www.virtualbox.org
[homebrew]: http://brew.sh
[homebrew cask]: http://caskroom.io

## Running

- With Docker CLI: 

```
docker build -t <username>/clojure-env-docker . && \
docker run -p 80:80 -p 4001:4001 -v $PWD:/code -it <username>/clojure-env-docker
```

If you want to start a REPL instead of the actual app, you can do so by adding `repl` to the end of the argument list for `docker run` like this:

`docker run -p 80:80 -p 4001:4001 -v $PWD:/code -it <username>/clojure-env-docker repl`

- With Docker Compose CLI:

To start the the entire service (which is just one app) and attach, just run `docker-compose up`.

## License

I don't own any of this.
