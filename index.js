// Require postman to openAPI module for conversion 
const postmanToOpenApi = require('postman-to-openapi'); 

// Require file system module to get postman collection in cd
const fs = require('fs');
const postmanDirectory = './postman_collection/';

// function to get postman collection
function getPostmanCollection() {
 
    // Reads the contents of current directory
    const files = fs.readdirSync('./postman_collection')
    
    // Gets file name with "postman_collection.json"
    for (let i = 0; i < files.length; i++) {
      if (files[i].includes("postman_collection.json")) {
        console.log('Postman Collection file: ' + files[i])
        return files[i];
      }
    }
}

async function main() {
    // postmanCollection = file name with "postman_collection.json"
    const postmanCollection = postmanDirectory + getPostmanCollection();
    // console.log(postmanCollection)
    
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

main()
