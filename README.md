# Convert Docs
Converts _.postman_collection.json to an output.yaml and previews it via ReDoc Docker image

<br>

## Usage Instructions

Start by exporting a Postman collection to this directory, then use the following in command line:

`
npm install 
` 

and

`
npm run convert
`

then your browser will open http://localhost:4567/ with a preview 

<br>


## Prerequisites

To run this application, I needed:

* [NodeJS](https://nodejs.org/en/download/)



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



 
  

 



 




