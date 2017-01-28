# Tor / Privoxy

This is a Docker image providing a container which allows you to browse the web and other Internet services anonymously using the [Tor](https://www.torproject.org) onion router and [Privoxy](https://www.privoxy.org).


## Build

```console
$ make build
```

## Usage

Starting the Tor / Privoxy container:

```console
$ docker run -d -p 8118:8118 --name tor-privoxy tor-privoxy:latest
```

Set your browser to use Privoxy as HTTP and HTTPS (SSL) proxy by setting the proxy configuration for address of ```127.0.0.1``` or ```<ip of docker host>``` and port ```8118```

### How can I tell if Tor is working, and that my connections really are anonymized?

There are sites you can visit that will tell you if you appear to be coming through the Tor network. Try the [Tor Check](https://check.torproject.org/) site and see whether it thinks you are using Tor or not.