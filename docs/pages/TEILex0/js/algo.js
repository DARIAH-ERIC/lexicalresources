docsearch({
    apiKey: '81fe7e18f931f5024ff56f875ed7e8fb',
    appId: 'TFWYQALT5Y',
    indexName: 'tei_lex',
    inputSelector: '.algo',
    debug: true, // Set debug to true if you want to inspect the dropdown
    transformData: function (hits) {
        // Transform the list of hits
        hits.forEach(hit => {
            //console.log("hit.url: ", hit.url);
            hit.url = hit.url.replace('https://dariah-eric.github.io/lexicalresources/pages/TEILex0/TEILex0.html', '');
            //console.log("replaced hit.url: ", hit.url);
            //console.log("window.location: ", window.location);
            var filename = hit.url.split('/').pop();
            var everythingButFilename = hit.url.substring(0, hit.url.lastIndexOf("/"));
            //console.log("filename: ", filename);
            //console.log("everythingButFilename: ", everythingButFilename);
        });
        console.log(hits);
        return hits;
    },
    handleSelected: function (input, event, suggestion, datasetNumber, context) {
        // Prevents the default behavior on click and rather opens the suggestion
        // in a new tab.
        if (context.selectionMethod === 'click') {
            input.setVal('');
            
         /*   switch (window.location.protocol) {
                case 'http:':
                    console.log("http");
                case 'https:':
                //remote file over http or https
                    console.log("https");
                break;
                case 'file:':
                    console.log("file");
                    var localBase = window.location.href.substring(0, window.location.href.lastIndexOf("/"));
                    var remoteBase = suggestion.url.substring(0, suggestion.url.lastIndexOf("/"));
                    suggestion.url = suggestion.url.replace(remoteBase, localBase); 
                //local file
                break;
                default:
                //some other protocol
            }*/
            
            window.open(suggestion.url, '_self');
        }
    }
});