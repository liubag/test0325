$(document).ready(function() {
		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
	
		$('.btn').click(function(){
			var id = $(this).attr("id");
			var goodstype_id = $("#goodstype_id" + id).text();
			var type_name = $("#type_name" + id).text();
			var unitprice = $("#unitprice" + id).text();
			var csg = $("#csg" + id).text();
			var hds = $("#hds" + id).text();
			var lz = $("#lz" + id).text();
			$("#type_name").attr("value",type_name);
			$("#id").attr("value",goodstype_id);
			$("#unitprice").attr("value",unitprice);
			$("#csg").attr("value",csg);
			$("#hds").attr("value",hds);
			$("#lz").attr("value",lz);
			var $x = $("#xia");
	    	var $s = $("#shang");
			if($x.is(":hidden")){
				$s.hide();
				$x.show();
			}
		});
		
		$("#canle").click(function(){
			var $x = $("#xia");
		    var $s = $("#shang");
			if($s.is(":hidden")){
				$x.hide();
				$s.show();
			}
		});
		$("#send").click(function(){
			var type_name = $("#type_name").attr("value");
			var unitprice = $("#unitprice").attr("value");
			var csg = $("#csg").attr("value");
			var hds = $("#hds").attr("value");
			var lz = $("#lz").attr("value");
			if(type_name == null || type_name.length <= 0 || 
				unitprice == null || unitprice.length <= 0 || 
				csg == null || csg.length <= 0 || 
				hds == null || hds.length <= 0 ||
				lz == null || lz.length <= 0){
	        	alert("信息输入不能留空.");
	        	return false;
	        }
	        return true;
		});
    });
    
    
	function forcedo2(){
		    if(!confirm('是否确定要删除该商品类型？')){return false;}
		    return true;
		}
function check(){
    	var gtn = $("#gtn").attr("value");
    	var gtcsg = $("#gtcsg").attr("value");
    	var gtu = $("#gtu").attr("value");
    	var gtnhds = $("#gtnhds").attr("value");
    	var gtlz = $("#gtlz").attr("value");
        if(gtn == null || gtn.length <= 0 || gtcsg == null || gtcsg.length <= 0 || gtu == null || gtu.length <= 0 || gtnhds == null || gtnhds.length <= 0 || gtlz == null || gtlz.length <= 0){
        	alert("信息输入不能留空.");
        	return false;
        }
        return true;
}