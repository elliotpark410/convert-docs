FROM redocly/redoc:latest

ENV SPEC_URL=swagger.yaml

COPY output.yaml /usr/share/nginx/html/swagger.yaml

EXPOSE 4567
