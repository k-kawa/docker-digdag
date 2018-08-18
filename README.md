# docker-digdag
This is a Docker image for [Digdag](https://www.digdag.io).

# Usage

You can start a Digdag server by running

```bash
docker run --rm -p 65432:65432 kkawa/digdag -m -b 0.0.0.0
```

or run it as a cli by running

```bash
docker run --rm -it -v $(pwd):/src kkawa/digdag init mydag
```
