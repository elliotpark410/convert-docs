# FROM command allows you to pull dependencies from other images. We are using redocly/redoc image from Docker hub
FROM redocly/redoc:latest

# ENV sets an environment variable within the container 
# Swagger framework allows developers to creaate interactive and human-readable API docs
ENV SPEC_URL=swagger.yaml

# COPY copies files from a local machine to a destination in the Docker container
COPY output.yaml /usr/share/nginx/html/swagger.yaml

# EXPOSE tells Docker that my webserver will listen on port 80
EXPOSE 80
