module.exports = {
  apps : [
    {
      name    : "convert",
      script  : "./index.js", 
      watch   : ["./postman_collection"],
      watch_delay : 5000,
      autorestart : false
    },
    {
      name    : "preview",
      script  : "./preview-docs.sh", 
      watch   : ["./output.yaml"],
      watch_delay : 5000,
    }
  ]
}
