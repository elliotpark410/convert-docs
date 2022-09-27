// Require postman to openAPI module for conversion 
const postmanToOpenApi = require('postman-to-openapi'); 

// Require file system module to get postman collection in cd
const fs = require('fs');
const path = require('path');
const { exit } = require('process');
const postmanDirectory = './postman_collection/';

// function to get most recent postman collection
function getPostmanCollection() {

  const files = fs.readdirSync(postmanDirectory)    

  for (let i = 0; i < files.length; i++) {
    if (files[i].includes("postman_collection.json")) {
      console.log('Postman Collection file: ' + files[i])
      return path.join(postmanDirectory, files[i]);
    }
  }
}

console.log(getPostmanCollection())
async function main() {
    // postmanCollection = file name with "postman_collection.json"
    const postmanCollection = getPostmanCollection();
    
    // Console error if File With "postman_collection.json" is Not in Current Directory
    if (postmanCollection === undefined) {
      console.error("File with 'postman_collection.json'")
    }
    
    // Converted output file is output.yaml in current directory
    const outputFile = './output.yaml'
    

    // Promise callback style (directly from 'https://www.npmjs.com/package/postman-to-openapi')
    return await postmanToOpenApi(postmanCollection, outputFile, { defaultTag: 'General' })
    .then(result => {
        console.log(`OpenAPI specs: ${result}`)
    })
    .catch(err => {
        console.log(err)
    })
}

main().then(() => {
  exit(0)
}).catch(err => console.log(err))
