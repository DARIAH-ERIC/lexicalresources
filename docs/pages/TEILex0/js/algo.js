docsearch({
    apiKey: '81fe7e18f931f5024ff56f875ed7e8fb',
    appId: 'TFWYQALT5Y',
    indexName: 'tei_lex',
    inputSelector: '.algo',
    debug: true, // Set debug to true if you want to inspect the dropdown
    transformData: function (hits) {
        // Transform the list of hits
        hits.forEach(hit => {
            //console.log(hit.url.replace('https://dariah-eric.github.io/', ''));
            hit.url = hit.url.replace('https://dariah-eric.github.io/lexicalresources/pages/TEILex0/TEILex0.html', '');
            console.log(hit.url);
        });
        return hits;
    },
    handleSelected: function (input, event, suggestion, datasetNumber, context) {
        // Prevents the default behavior on click and rather opens the suggestion
        // in a new tab.
        if (context.selectionMethod === 'click') {
            input.setVal('');
            
            window.open(suggestion.url, '_self');
        }
    }
});