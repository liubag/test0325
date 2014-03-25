

$(document).ready(function () {
    var selector = "#content1 dl dt:eq(" + $.cookie("backNaviIndex") + ")";
    $(selector).css("background-image", 'url(/WangGe/ScatteredGrid/pic/pic_5.jpg)').siblings("dd").show(100);
    $('#content1 dl dt').click(function () {
        $.cookie("backNaviIndex", $('#content1 dl dt').index($(this)));
        if ($(this).siblings("dd").first().is(":hidden")) {
            $('#content1 dl dt').css("background-image", 'url(/WangGe/ScatteredGrid/pic/pic_4.jpg)').siblings("dd").hide(100);
            $(this).css("background-image", 'url(/WangGe/ScatteredGrid/pic/pic_5.jpg)');
            $(this).stop(true, true).siblings("dd").slideToggle(100, function () { });
        }

    });
});

function refreshSize() {
    if (top.location != self.location) {
        var a = window.parent.document.getElementsByName('rightIframe');
        for (var i = 0; i < a.length; i++) {
            if (a[i].name == self.name) {
                a[i].height = this.document.body.offsetHeight + 50; 
                return;
            }
        }
    }
}