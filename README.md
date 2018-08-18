# docker-digdag
This is a Docker image for [Digdag](https://www.digdag.io).

# Usage

**There's no published image at Docker Hub yet.**

To build this image.

```bash
docker build -t local/digdag
```

Once you build the image for your own, you can use it as a server by running

```bash
docker run --rm -p 65432:65432 local/digdag -m -b 0.0.0.0
```

or as a client by running

```bash
docker run --rm -it -v $(pwd):/src local/digdag init mydag
```
