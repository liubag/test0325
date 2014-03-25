$(function(){
	
		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
		
})
function check(){
    	var tc = $("#tc").attr("value");
        var mon = $("#mon").attr("value");
        var ra = $("#ra").attr("value");
        if(tc == null || tc.length <= 0 || mon == null || mon.length <= 0 || ra == null || ra.length <= 0 ){
        	alert("信息输入不能留空.");
        	return false;
        }
        return true;
}
function forcedo2(){
    if(!confirm('是否确定要删除该租用类型？')){return false;}
    return true;
}