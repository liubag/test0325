
$(function(){
	
		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
		
})
function check1(){
    	var tn = $("#tn").attr("value");
        if(tn == null || tn.length <= 0){
        	alert("信息输入不能留空.");
        	return false;
        }
        return true;
}
function check2(){
	var gn = $("#gn").attr("value");
    if(gn == null || gn.length <= 0){
    	alert("信息输入不能留空.");
    	return false;
    }
    return true;
}
function check3(){
	var grn = $("#grn").attr("value");
    if(grn == null || grn.length <= 0){
    	alert("信息输入不能留空.");
    	return false;
    }
    return true;
}