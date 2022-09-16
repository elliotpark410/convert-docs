module.exports = {
  apps : [
    {
      name    : "postmancollection",
      script  : "./convert-docs.sh", 
      watch   : ["v1.postman_collection.json"],
      watch_delay: 5000
    }
  ]
}
