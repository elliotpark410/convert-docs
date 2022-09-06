const postmanToOpenApi = require('postman-to-openapi'); // Postman Magic
const fs = require('fs');

function getPostmanCollection() {
    // Global scope, never use `var` use `let` or `const` instead.
    // EP: Reads the Contents of Current Directory
    const files = fs.readdirSync('./')
    
    // EP: Get File Name with "postman_collection.json"
    for (let i = 0; i < files.length; i++) {
      if (files[i].includes("postman_collection.json")) {
        console.log('Postman Collection file: ' + files[i])
        return files[i];
      }
    }
}

async function main() {
    const postmanCollection = getPostmanCollection();
    
    // EP: Console Error if File With "postman_collection.json" is Not in Current Directory
    if (postmanCollection === undefined) {
      console.error("File name including 'postman_collection.json' not found in current directory")
    }
    
    // Output OpenAPI Path
    const outputFile = './output.yaml'
    
    // Async/await
    // Promise callback style
    return await postmanToOpenApi(postmanCollection, outputFile, { defaultTag: 'General' });
}

main()
    .then(console.log)
    .catch(console.error);