# Convert Docs
Converts _.postman_collection.json to an output.yaml and previews it via ReDoc Docker image

<br>

## Usage Instructions

Start by going to command line and enter:

`
npm install 
` 

and

`
npm start
`

then export a Postman collection to postman_collection directory



The command will: 
1. pm2 will capture the change in the postman_collection directory, then run preview-docs.sh
2. node index.js which will convert postman_collection.json file to output.yaml file
3. build Docker garuda-docs-image and remove garuda-docs-container if it exists
4. create Docker garuda-docs-container
5. open http://localhost:4444/ with a preview. Please refresh page to see latest and greatest


<br>


## Prerequisites

To run this application on Windows 11, I needed:

* [NodeJS](https://nodejs.org/en/download/)

* [npm postman-to-openapi](https://www.npmjs.com/package/postman-to-openapi)

* [Docker](https://docs.docker.com/desktop/install/windows-install/)

* [Ubuntu on WSL2 for Windows 11](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview)

* [ReDoc Docker Image instructions](https://hub.docker.com/r/redocly/redoc/)


* Open Ubuntu 20.04.4 LTS and make sure you have Docker installed
````
sudo service docker status
````

* Pull the docker image
```
sudo docker pull redocly/redoc
```

* Serve remote spec by URL
```
sudo docker run -it --rm -p 80:80 -e SPEC_URL='http://localhost:8000/swagger.yaml' redocly/redoc
```

* Serve local file
<br>

```
sudo docker run -it --rm -p 80:80 -v /mnt/{{pwd}}/output.yaml:/usr/share/nginx/html/swagger.yaml -e SPEC_URL=swagger.yaml redocly/redoc
```


* Serve local file and watch for updates
```
sudo docker run -it --rm -p 80:80 -v /mnt/{{pwd}}/:/usr/share/nginx/html/swagger -e SPEC_URL=swagger/output.yaml redocly/redoc
```

* Screenshot of ReDoc image commands in Ubuntu 

<img src="Images\ReDoc-Docker-Image-screenshots.png" title="Screenshot of Ubuntu terminal with ReDoc Docker Image commands">



 
  

 



 




