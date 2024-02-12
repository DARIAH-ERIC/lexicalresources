document.addEventListener("DOMContentLoaded", function (event) {
    
    // was menu open?
    var existing = localStorage.getItem('menu-selections');
    if (existing) {
        existing = existing.split(',');
        existing.forEach(item => {
            //console.log(document.getElementById(item));
            document.getElementById(item).classList.add('clicked');
            document.getElementById(item).closest('div.toc-showhide').nextElementSibling.style.display = 'block';
        })
    }
    
    document.querySelectorAll('.tocTree .toc-showhide').forEach(item => {
        item.addEventListener('click', event => {
            var element = item.parentElement.querySelector("div.continuedtoc");
            if (window.getComputedStyle(element).display === 'block') {
                element.style.display = 'none';
            } else {
                element.style.display = 'block';
            }
        })
    })
    
    document.querySelectorAll('.plusminus').forEach(item => {
        item.addEventListener('click', event => {
            if (item.classList.contains('clicked')) {
                item.classList.remove('clicked')
                 // Get the existing data
                var existing = localStorage.getItem('menu-selections');
                
                // If no existing data, create an array
                // Otherwise, convert the localStorage string to an array
                existing = existing ? existing.split(','):[];
                
                // Add new data to localStorage Array
                existing.splice(existing.indexOf(item.id));
                
                // Save back to localStorage
                localStorage.setItem('menu-selections', existing.toString());
            } else {
                item.classList.add('clicked')
                // Get the existing data
                var existing = localStorage.getItem('menu-selections');
                
                // If no existing data, create an array
                // Otherwise, convert the localStorage string to an array
                existing = existing ? existing.split(','):[];
                
                // Add new data to localStorage Array
                existing.push(item.id);
                
                // Save back to localStorage
                localStorage.setItem('menu-selections', existing.toString());
            }
        })
    })
    
    document.querySelectorAll('pre').forEach(item => {
        
        item.querySelectorAll('.egXML_invalid').forEach(child => {
            item.classList.add('egXML_invalid');
            item.closest('.tab-content').classList.add('egXML_invalid');
            /*if (item.nextElementSibling.classList.contains('toolbar')) {
             console.log(item);
             Array.prototype.slice.call(item.nextElementSibling.querySelectorAll(".copy_button")).forEach(cp => {
             cp.style.disply='none';
             })
            
             } else {
             console.log("none");
             }*/
        });
    });
    
    
    /*open first example in example sets*/
     /*document.querySelectorAll('.examples .tab input')[0].checked = true;*/
     /* document.querySelectorAll('.tabs').forEach(set => {
     set.querySelector('.tab').querySelector('input').checked = true;
     });*/
    
    
     /*get spec */
     /*   var bib = document.getElementById('bibliography');
     var temp = document.createElement('span');
     temp.setAttribute("id", "get");
     var get = bib.parentNode.insertBefore(temp, bib.nextSibling);
     var xhr = new XMLHttpRequest();
     xhr.open('GET', 'spec.html');
     xhr.onload = function () {
     if (xhr.status === 200) {
     get.innerHTML = xhr.response;
     Prism.highlightAllUnder(get);
     } else {
     console.log('Request failed.  Returned status of ' + xhr.status);
     }
     };
     xhr.send();*/
     
    document.querySelectorAll('.tab').forEach(current => {
        var next = current.nextElementSibling;
        if (next && next.classList.contains('tab') ) {
            current.classList.add('drop');
        } 
    });
        
});

document.querySelectorAll('.tabs').forEach(set => {
    set.querySelector('.tab').querySelector('input').checked = true;  
});


 
