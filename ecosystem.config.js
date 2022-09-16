module.exports = {
  apps : [
    {
      name    : "convert-docs",
      script  : "./index.js", 
      watch   : ["./v1.postman_collection.json"],
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
