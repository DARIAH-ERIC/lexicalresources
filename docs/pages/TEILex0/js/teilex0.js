$(function () {
    console.log("test if works");
    $(".tocTree .showhide").click(function () {
        $(this).find(".tocShow,.tocHide").toggle();
        $(this).parent().find("ul.continuedtoc").toggle();
    });
})