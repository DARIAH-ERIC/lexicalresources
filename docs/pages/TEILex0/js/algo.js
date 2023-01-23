docsearch({
    apiKey: '81fe7e18f931f5024ff56f875ed7e8fb',
    appId: 'TFWYQALT5Y',
    indexName: 'tei_lex',
    inputSelector: '.algo',
    debug: false, // Set debug to true if you want to inspect the dropdown
  /*  transformData: function (hits) {
        // Transform the list of hits
        hits.forEach(hit => {
           console.log(hit);
        });
        
        return hits;
    },*/
    handleSelected: function (input, event, suggestion, datasetNumber, context) {
        // Prevents the default behavior on click and rather opens the suggestion
        // in a new tab.
        if (context.selectionMethod === 'click') {
            input.setVal(''); 
                
             if (window.location.protocol == "file:") {
                    var localBase = window.location.href.substring(0, window.location.href.lastIndexOf("/"));
                    var remoteBase = suggestion.url.substring(0, suggestion.url.lastIndexOf("/"));
                    suggestion.url = suggestion.url.replace(remoteBase, localBase); 
               
            }
            
            window.open(suggestion.url, '_self');
        }
    }
});