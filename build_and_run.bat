docker build -f docker/Dockerfile -t gzweb_wrapper .
docker run -it --rm -p 8080:8080 gzweb_wrapper