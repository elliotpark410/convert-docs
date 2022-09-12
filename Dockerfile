# Docker creates a sandbox environment to simplify managing and running distributed applications
# Allows you to package applicatons with all it dependencies into a container
# Docker image is a file used to execute code in a container


# FROM command allows you to pull dependencies from other images. We are using redocly/redoc image from Docker hub
FROM redocly/redoc:latest

# ENV sets an environment variable within the container 
# Swagger framework allows developers to creaate interactive and human-readable API docs
ENV SPEC_URL=swagger.yaml

# COPY copies files from a local machine to a destination in the Docker container
COPY output.yaml /usr/share/nginx/html/swagger.yaml

# EXPOSE tells Docker that my webserver will listen on port 80
EXPOSE 80


# Docker commands

# Command line: docker build . -t garuda-docs-v1"
# Docker builds Docker images and a "context"
# "Context" is the set of files located in the specified PATH or URL
# . if the PATH is period, then all the files in local directory get sent to the Docker daemon
# -t is a tag name 

# Command line: docker run -it --rm -dp 4444:80 garuda-docs-v1
# Docker creates a writeable container layer over the specified image
# --rm automatically removes the container when it exits
# -d option will have the container run in detached mode in the background
# -p option is used to export the ports 
# in this example, port 4444 will be the Docker host to access the container and the 80 is the port used by the application