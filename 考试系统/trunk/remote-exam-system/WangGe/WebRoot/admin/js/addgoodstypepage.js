
function check(){
    	var gtn = $("#gtn").attr("value");
        if(gtn == null || gtn.length <= 0){
        	alert("信息输入不能留空.");
        	return false;
        }
        return true;
}