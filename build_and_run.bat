docker build -f docker/Dockerfile -t gzweb_wrapper .
docker run -it --rm -p 8888:8888 gzweb_wrapper