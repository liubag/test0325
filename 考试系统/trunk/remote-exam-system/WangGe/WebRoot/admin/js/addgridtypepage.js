$(function(){
	
		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
		
})
function check(){
    	var gtn = $("#gtn").attr("value");
        var gtcsg = $("#gtcsg").attr("value");
        var gtup = $("#gtup").attr("value");
        var gthds = $("#gthds").attr("value");
        var gtlz = $("#gtlz").attr("value");
        if(gtn == null || gtn.length <= 0 || gtcsg == null || gtcsg.length <= 0 || gtup == null || gtup.length <= 0 ||gthds == null || gthds.length <= 0 ||gtlz == null || gtlz.length <= 0){
        	alert("信息输入不能留空.");
        	return false;
        }
        return true;
}
function forcedo2(){
    if(!confirm('是否确定要删除该格子类型？')){return false;}
    return true;
}