<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link href="css/showAllGuangGao.css" type="text/css" rel="stylesheet" />
<script src="js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="js/jquery.contextmenu.r2.packed.js" type="text/javascript"></script>
<script type="text/javascript"><!--
 $(function(){
 	$.ajax({
		type: "GET",
		url: "showGuangGaoToUpdata_aa.do",
		dataType : "text",
		beforeSend:function(){
	 		var height = $(document).height();
			$("#rightIframe",parent.document.body).height(height + 150);
		},
		error:function(){
		},
		success: function(msg){
			$("#waiting").hide();
			$("#shuaxin").hide();
			if(msg == ''){
				alert('加载出错.');
				return;
			}
			$("#ul_show").html(msg);
			//所有class为ggao的li标签都会绑定此右键菜单
		     $('.ggao').contextMenu('myMenu1', 
		     {
		          bindings: 
		          {
		          	'add_up': function(t) {
			            do_add('add_up',t);
		            },
		            'add': function(t) {
			              do_add('add',t);
		            },
		            'updata': function(t) {
		            	if($('.ggao_add').length > 0){
			              	alert("请先取消未确定添加的广告位再操作");
			              	return;
			            }
			            //修改
			            var li_id = $(t).attr("id");
			            var add = li_id.substring(0, 1);
		              	alert('updata' + add);
		            },
		            'dele': function(t) {
		            	if($('.ggao_add').length > 0){
			              	alert("请先取消未确定添加的广告位再操作");
			              	return;
			            }
		               if($('.ggao').length == 1){
			              	alert("无法删除,广告位至少要保留一个.");
			              	return;
			            }
			            if(!confirm('是否确定删除操作？')){return;}
			            else{
			            	//需要异步删除操作
			            	var li_id = $(t).attr("id");
							$.ajax({
							type: "GET",
							url: "deleGuangGao_aa.do?li_id="+li_id,
							dataType : "text",
							beforeSend:function(){
						 		$("#waiting").show();
								$("#ul_show").hide();
							},
							error:function(){
							},
							success: function(msg){
								if(msg=='success'){
									$(t).remove(); 
								}else if(msg=='fail'){
									alert("删除操作失败.");
								}else if(msg=='login'){
									alert("登录状态丢失.");
									top.location.href = "admin_exit.do";
								}
							},
							complete:function(){
								$("#waiting").hide();
								$("#ul_show").show();
								var height = $(document).height();
								$("#rightIframe",parent.document.body).height(height + 150);
							}
						});
			            	
			            }
			            	
		            }
		          }
		    });
		},
		complete:function(){
			 var height = $(document).height();
			$("#rightIframe",parent.document.body).height(height + 150);
		}
	});
 	
 	
})
function do_add(add_type,t){
	if($('.ggao_add').length > 0){
	              		alert("请先取消未确定添加的广告位再操作");
	              		return;
	              }
              var str_add = "<li class=\"ggao_add\">"
              	+ "<div style=\"left:10px; top:0; width:130px; height:90px;\"><img id=\"01\" class=\"img_add\" onmouseover=\"this.style.border=\'1px solid #FFFFFF\'\" onmouseout=\"this.style.border=\'1px solid #000000\'\" src=\"${pageContext.request.contextPath}/admin/aahome/pic/ggao_a01.jpg\"/></div>"
              	+ "<div style=\"left:150px; top:0; width:130px; height:90px;\"><img id=\"02\" class=\"img_add\" onmouseover=\"this.style.border=\'1px solid #FFFFFF\'\" onmouseout=\"this.style.border=\'1px solid #000000\'\" src=\"${pageContext.request.contextPath}/admin/aahome/pic/ggao_a02.jpg\"/></div>"
				+ "<div style=\"left:290px; top:0; width:130px; height:90px;\"><img id=\"03\" class=\"img_add\" onmouseover=\"this.style.border=\'1px solid #FFFFFF\'\" onmouseout=\"this.style.border=\'1px solid #000000\'\" src=\"${pageContext.request.contextPath}/admin/aahome/pic/ggao_a03.jpg\"/></div>"
			    + "</li>";
              	var $div_1 = $(str_add);	//  创建元素
              	if(add_type=='add'){
					$div_1.insertAfter(t);
				}else{
					$div_1.insertBefore(t);
				}
				//所有class为ggao的li标签都会绑定此右键菜单
			     $('.ggao_add').contextMenu('myMenu2', 
			     {
			          bindings: 
			          {
			            'dele': function(t) {
			              	$(t).remove(); 
			            }
			          }
			    });
				$('.img_add').dblclick(function(){
					//li_id
					var li_id = $(t).attr("id");
					//获取 类型
					var add = $(this).attr("id"); 
					//获取时间 做为 id
	           		var myDate = new Date();
	           		var mytime="" + myDate.getFullYear()+(myDate.getMonth()*1+1)+myDate.getDate()+myDate.getHours()+myDate.getMinutes()+myDate.getSeconds();
              	//	alert(mytime + "  " + add_type + " " + li_id);
              		//需要触发添加
              		var sure_add_str = "<li class=\"ggao_sure_add\"  style=\"display:none;\">" 
              			+  $("#ggao_sure_add").html(); 
              			+ "</li>";
              	    var $sure_add_str = $(sure_add_str);
              	    if(add_type=='add'){
              	    	$sure_add_str.insertAfter(t);
					}else{
						$sure_add_str.insertBefore(t);
					}
              		
              		$('.ggao_sure_add').find('.mytime').attr("value",mytime);
              		$('.ggao_sure_add').find('.add_type').attr("value",add_type);
              		$('.ggao_sure_add').find('.li_id').attr("value",li_id);
              		var $img = $('.ggao_sure_add').find('img');
              		var $form = $('.ggao_sure_add').find('form');
              		if(add=='01'){
              			$img.eq(0).show();
              			$img.eq(1).remove();
              			$img.eq(2).remove();
              			$form.eq(0).show();
              			$form.eq(1).remove();
              			$form.eq(2).remove();
              		}else if(add=='02' || add=='03'){
              			if(add=='02'){
	              			$img.eq(0).hide();
	              			$img.eq(1).show();
	              			$img.eq(2).hide();
	              			$('.ggao_sure_add').find('.add').attr("value",2);
              			}else if(add=='03') {
              				$img.eq(0).hide();
	              			$img.eq(1).hide();
	              			$img.eq(2).show();
	              			$('.ggao_sure_add').find('.add').attr("value",3);
              			}
              			$form.eq(0).hide();
              			$form.eq(1).show();
              			$form.eq(2).hide();
              		}
              		$('.ggao_add').hide();
              		$(".ggao_sure_add").show();
              		var height = $(document).height();
					$("#rightIframe",parent.document.body).height(height + 150);
              		$(".ggao_sure_add").find("#res").click(function(){
	 					$('.ggao_add').show();
	              		$(".ggao_sure_add").remove();
	 				});
	 				$(".ggao_sure_add").find("#cancle").click(function(){
	 					$('.ggao_add').remove();
	 					$(".ggao_sure_add").remove();
	 					var height = $(document).height();
						$("#rightIframe",parent.document.body).height(height + 150);
	 				});
				});
				
}
</script>

</head>

<body>
<div class="wrapper">
<h1>《网格》首页广告位管理,右键操作、格式双击选择，右键取消</h1>

	<div id="focus">
	<ul>
	<li id="ggao_sure_add" style="display:none;">
				<div style="left:0; top:0; width:780px; height:382px;">
					<div style="width: 258px;height: 100%;border: 1px solid #000000;float: left;">
						<table align="center">
						<tr style="text-align: center;"> 
						<td>新增广告位类型：</td>
						</tr>
						<tr style="text-align: center;">
						<td>
						<img style="width: 260px;height: 180px;" class="1" src="${pageContext.request.contextPath}/admin/aahome/pic/a01.jpg"/>
						<img style="width: 260px;height: 180px;" class="2" src="${pageContext.request.contextPath}/admin/aahome/pic/a02.jpg"/>
						<img style="width: 260px;height: 180px;" class="3" src="${pageContext.request.contextPath}/admin/aahome/pic/a03.jpg"/>
						</td>
						</tr>
						<tr style="text-align: center;">
						<td>
						<p><input type="button" value="重选" id="res"/></p>
						<p></p>
						<p><input type="button" value="取消" id="cancle"/></p>
						</td>
						</tr>
						</table>
					</div>
					<div style="left:260px; width: 518px;height: 100%;border: 1px solid #000000;float: left;">
						<s:form cssClass="1" action="addGuangGao_aa" method="post" autocomplete="off" enctype="multipart/form-data" theme="simple">
						<input type="hidden" class="mytime" name="mytime"/>
						<input type="hidden" class="add_type" name="add_type"/>
						<input type="hidden" class="li_id" name="li_id"/>
						<input type="hidden" class="add" name="add" value="1"/>
						<table style="width: 100%;" >
						<tr>
						<td colspan="3" class="td4">制定广告</td>
						</tr>
						<tr>
						<td class="td1">（1）图片</td><td class="td2"><input type="file" name="file" id="file11" class="required input1" style="ime-mode:Disabled"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">（1）超链接</td><td class="td2"><input type="text" name="href" size="30"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">&nbsp; </td>
						<td class="td2"><input type="submit" value="制定" id="send"/></td>
						<td class="td3"><input type="reset" value="重置" id="res"/></td>
						</tr>
						</table>
						</s:form>
						<s:form cssClass="2"  action="addGuangGao_aa" method="post" autocomplete="off" enctype="multipart/form-data" theme="simple">
						<input type="hidden" class="mytime" name="mytime"/>
						<input type="hidden" class="add_type" name="add_type"/>
						<input type="hidden" class="li_id" name="li_id"/>
						<input type="hidden" class="add" name="add"/>
						<table style="width: 100%;" >
						<tr>
						<td colspan="3" class="td4">制定广告</td>
						</tr>
						<tr>
						<td class="td1">（1）图片</td><td class="td2"><input type="file" name="file" id="file11" class="required input1" style="ime-mode:Disabled"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">（1）超链接</td><td class="td2"><input type="text" name="href" size="30"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">（2）图片</td><td class="td2"><input type="file" name="file" id="file11" class="required input1" style="ime-mode:Disabled"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">（2）超链接</td><td class="td2"><input type="text" name="href" size="30"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">（3）图片</td><td class="td2"><input type="file" name="file" id="file11" class="required input1" style="ime-mode:Disabled"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">（3）超链接</td><td class="td2"><input type="text" name="href" size="30"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">（4）图片</td><td class="td2"><input type="file" name="file" id="file11" class="required input1" style="ime-mode:Disabled"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">（4）超链接</td><td class="td2"><input type="text" name="href" size="30"/></td><td class="td3">3</td>
						</tr>
						<tr>
						<td class="td1">&nbsp; </td>
						<td class="td2"><input type="submit" value="制定" id="send"/></td>
						<td class="td3"><input type="reset" value="重置" id="res"/></td>
						</tr>
						</table>
						</s:form>
					</div>
				</div>
			</li>
	</ul>
		<ul id="ul_show">
			
			
		</ul>
	</div>
	
	<div>
	 <!--右键菜单的源-->
     <div class="contextMenu" id="myMenu1">
      <ul>
      	<li id="add_up">往上插入广告位</li>
        <li id="add">往下插入广告位</li>
        <li id="updata">修改当前广告位</li>
        <li id="dele">删除当前广告位</li>
      </ul>
    </div>
     <div class="contextMenu" id="myMenu2">
      <ul>
        <li id="dele">取消</li>
      </ul>
    </div>
	</div>
</div><!-- wrapper end -->
<div id="shuaxin" style="text-align: center;width: 100%;"><a href="${pageContext.request.contextPath}/admin/aahome/showAllGuangGao.jsp" target="rightIframe">点击可以刷新</a></div>
<div id="waiting" style="text-align: center;width: 100%;">  
	<div>  
	<img alt="" src="${pageContext.request.contextPath}/pic/empty_180_180.gif"/> 
	</div>   
</div>  
</body>
</html>