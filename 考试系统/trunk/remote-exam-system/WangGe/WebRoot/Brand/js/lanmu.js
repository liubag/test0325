// JavaScript Document

$(document).ready(function () {
    $("#daohang2 dl dt").click(function () {
        if ($(this).siblings("dd").first().is(":hidden")) {
            $(this).css("background-image", 'url(/WangGe/Brand/pic/lanmu2.jpg)');
            $(this).stop(true, true).siblings("dd").slideToggle(100, function () { });
        }else{
			$(this).css("background-image", 'url(/WangGe/Brand/pic/lanmu1.jpg)');
            $(this).stop(true, true).siblings("dd").slideToggle(100, function () { });
			}
    });
});