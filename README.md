# docker-phoenix-dev

* Phoenix 20.07.18

## Versions
- Phoenix 1.10.3 - https://phoenixframework.org/
- Dockerize v0.6.1 - https://github.com/jwilder/dockerize

## Usage

*nix
```
docker run --rm -it \
  -v ${pwd}/src:/opt/app \
  chrisgarrett/phoenix-dev:20.07.18 
```

Windows cmd
```
docker run --rm -it -v %cd%/src:/opt/app chrisgarrett/phoenix-dev:20.07.18 
```


## Credits

Used Paul Schoenfelder's (bitwalker) work as a launch point https://hub.docker.com/r/bitwalker/alpine-elixir-phoenix

