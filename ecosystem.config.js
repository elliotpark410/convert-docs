module.exports = {
  apps : [
    {
      name    : "convert-docs",
      script  : "./index.js", 
      watch   : ["./postman_collection"],
      watch_delay : 5000,
      autorestart : false
    },
    {
      name    : "preview",
      script  : "./convert-docs.sh", 
      watch   : ["./output.yaml"],
      watch_delay : 5000,
    }
  ]
}
