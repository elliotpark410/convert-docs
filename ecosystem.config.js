module.exports = {
  apps : [
    {
      name    : "preview",
      script  : "./preview-docs.sh", 
      watch   : ["./postman_collection"],
      watch_delay : 5000,
    }
  ]
}
