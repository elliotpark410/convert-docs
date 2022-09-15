module.exports = {
  apps : [
    {
      name    : "convert-docs",
      script  : "DOCKER_BUILDKIT=0 docker build . -t garuda-docs-image ./output.yaml && docker run --name garuda-docs-container -it --rm -dp 4444:80 garuda-docs-image",
      watch   : ["./output.yaml"],
      watch_delay: 1000
    }
  ]
}
