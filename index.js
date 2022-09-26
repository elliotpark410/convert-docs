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
  let filesArray = []

  files.forEach((postmanFile) => {
    if (postmanFile.includes("postman_collection")) {
      let stats = fs.statSync(postmanDirectory + postmanFile)
      filesArray.push({
        "file":postmanFile, 
        "mtime": stats.mtime.getTime()
      })
    }
  })

  filesArray.sort((a,b) => {
    return b.mtime - a.mtime
  })

  return path.join(postmanDirectory, filesArray[0].file)
}


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
