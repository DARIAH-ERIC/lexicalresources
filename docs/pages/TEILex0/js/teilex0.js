document.addEventListener("DOMContentLoaded", function (event) {

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
            } else {
                item.classList.add('clicked')
            }
        })
    })

    document.querySelectorAll('pre').forEach(item => {
      /*console.log(item);*/
        /*var nextSibling = item.nextElementSibling;
          console.log(nextSibling);*/
        item.querySelectorAll('.egXML_invalid').forEach(child => {
            item.classList.add('egXML_invalid');




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

});
