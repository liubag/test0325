<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>《网格》管理后台</title>
    <sx:head/>
    
    <script language="JavaScript">
    	var url = top.location.href;
    	var url2 = "http://${header['host']}${pageContext.request.contextPath}/admin/manage.jsp";
    	if(url != url2){
    		top.location.href = "${pageContext.request.contextPath}/admin/manage.jsp";
    	}
    	
	</script>
	
    <script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/admin/css/manage.css" type="text/css" rel="stylesheet" />
    <script language="JavaScript" type="text/javascript">
    //<![CDATA[
	$(function(){
	    var $div_li =$("div.tab_menu ul li");
	    $div_li.click(function(){
			$(this).addClass("selected")            //当前<li>元素高亮
				   .siblings().removeClass("selected");  //去掉其它同辈<li>元素的高亮
            var index =  $div_li.index(this);  // 获取当前点击的<li>元素 在 全部li元素中的索引。
			$("div.tab_box > div")   	//选取子节点。不选取子节点的话，会引起错误。如果里面还有div 
					.eq(index).show()   //显示 <li>元素对应的<div>元素
					.siblings().hide(); //隐藏其它几个同辈的<div>元素
		}).hover(function(){
			$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover");
		})
	})
	//]]>
	
     dojo.event.topic.subscribe("treeSelected", function treeNodeSelected(node) {
			        
		if(node.node.widgetId == "root" || node.node.widgetId == "root_root"){
			node.node.expand();
		}else{
			var goto1 = node.node.widgetId.substring(5, 6);
			var goto2 = node.node.widgetId.substring(7, node.node.widgetId.length);
			$("#nowin").html(node.node.parent.parent.title + ">"+ node.node.parent.title + ">" + node.node.title);
			switch(goto1){
				case "1" :
					switch(goto2){
						case "1" :
							$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/aahome/showAllGuangGao.jsp");
							break;
						case "2" :
							$("#rightIframe",parent.document.body).attr("src","showKeyWord_by_page.do");
							break;
					}
					break;
				case "2" :
					switch(goto2){
						case "1" :
							$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/ScatteredGrid/find.jsp");
							break;
						case "3" :
							$("#rightIframe",parent.document.body).attr("src","showAudience_by_page.do?page=1");
							break;
						case "4" :
						//	$("#rightIframe",parent.document.body).attr("height",537);
							$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/ScatteredGrid/enrollAccount01.jsp");
							break;
						case "7" :
							$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/addScatteredGoogsType.jsp");
							break;
						case "8" :
							$("#rightIframe",parent.document.body).attr("src","showAllGoods_by_page_admin.do?page=1&goodstatu=1&gridname=");
							break;
						case "10" :
							$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/ScatteredGrid/addScatteredRendType.jsp");
							break;
						case "11" :
							$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/ScatteredGrid/addScatteredGridType.jsp");
							break;
						case "12" :
							$("#rightIframe",parent.document.body).attr("src","showAllGrid_by_page_user.do?page=1&statu=12&grid_type_id=3");
							break;
						case "13" :
							$("#rightIframe",parent.document.body).attr("src","showAllPreferential_admin.do?page=1&PStatus=1");
							break;
						case "14" :
							$("#rightIframe",parent.document.body).attr("src","showDoGoodsNote_by_page_admin.do?page=1&time=&findforother=&gridname=");
							break;
					}
				break;
				case "3":
					switch(goto2){
					case "1":
						$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/BrandGrid/addBrandGridGridType.jsp");
						break;
					case "2":
						$("#rightIframe",parent.document.body).attr("src","showAllBrandgrid.do?page=1");
						break;
					case "3":
						$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/BrandGrid/enrollBrandgrid.jsp");
						break;
					case "4":
						alert("4");
						break;
					case "5":
						$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/BrandGrid/showSalseman.jsp");
						break;
					case "6":
						$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/BrandGrid/showBrandgridGrid.jsp");
						break;
					case "7":
						$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/BrandGrid/showGridOwner.jsp");
						break;
					case "8":
						$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/BrandGrid/showGridGoods.jsp");
						break;
					case "9":
						$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/BrandGrid/showPreferential.jsp");
						break;
					case "10":
						$("#rightIframe",parent.document.body).attr("src","${pageContext.request.contextPath}/admin/BrandGrid/showSellnote.jsp");
						break;
					case "11":
						alert("11");
						break;
					}
				break;
				case "4":
					switch(goto2){
						case "1":
						$("#rightIframe",parent.document.body).attr("src","showAllAudience.do?page=1");
						break;
					}
				break;
					
			}
			
		}
		 
	});
	
	
	
	</script>
	
	
</head>
<body>
<form id="form1">
    <div id="main">
        <center>
            <div id="header">
                <div id="header1">
                	你好！<s:property value="#session.admin_loginstatu"/>，
					<s:url id="url" action="admin_exit">
					</s:url>
					<s:a href="%{url}" method="post">安全退出</s:a>
                </div>
                <div id="header2">
                </div>
            </div>
            <div id="nav">
                <div id="nav1">
                    	你当前位置：<span id="nowin"></span>
                </div>
            </div>
            <div id="content">
            
                <div id="content1">
                
                 <div class="tab">
					<div class="tab_menu">
						<ul>
							<li class="selected">首页</li>
							<li>学生网格</li>
							<li>品牌网格</li>
							<li>注册用户</li>
						</ul>
					</div>
					<div class="tab_box"> 
						  <div>
						  <sx:tree label="首页" templateCssPath="/struts/tree.css"
								showRootGrid="true" showGrid="true" treeSelectedTopic="treeSelected"
								disabled="" collapsedNotifyTopics="" id="root">
								<sx:treenode label="广告位管理" id="root">
									<sx:treenode label="广告位管理" id="child1_1"/>
								</sx:treenode>
								<sx:treenode label="关键词库管理" id="root">
									<sx:treenode label="关键词库" id="child1_2"/>
								</sx:treenode>
							</sx:tree>
							</div>
						  <div class="hide">
						 	 <sx:tree label="学生网格" templateCssPath="/struts/tree.css"
								showRootGrid="true" showGrid="true" treeSelectedTopic="treeSelected"
								disabled="" collapsedNotifyTopics="" id="root">
								<sx:treenode label="查询" id="root">
									<sx:treenode label="查询" id="child2_1"/>
								</sx:treenode>
								<sx:treenode label="用户账户管理" id="root">
									<sx:treenode label="全部账户" id="child2_3" />
									<sx:treenode label="添加用户" id="child2_4" />
								</sx:treenode>
								<sx:treenode label="商品管理" id="root">
									<sx:treenode label="商品类型制定" id="child2_7" />
									<sx:treenode label="全部商品信息" id="child2_8" />
								</sx:treenode>
								<sx:treenode label="格子管理" id="root">
									<sx:treenode label="格子出租方式制定" id="child2_10" />
									<sx:treenode label="格子类型制定" id="child2_11" />
									<sx:treenode label="全部格子信息" id="child2_12" />
								</sx:treenode>
								<sx:treenode label="优惠信息管理" id="root">
									<sx:treenode label="全部优惠信息" id="child2_13" />
								</sx:treenode>
								<sx:treenode label="销售记录查看" id="root">
									<sx:treenode label="全部销售记录" id="child2_14"/>
								</sx:treenode>
							</sx:tree>
						 </div>
						 <div class="hide">
						 	 <sx:tree label="品牌网格" templateCssPath="/struts/tree.css"
								showRootGrid="true" showGrid="true" treeSelectedTopic="treeSelected"
								disabled="" collapsedNotifyTopics="" id="root">
								<sx:treenode label="格子类型" id="root">
									<sx:treenode label="格子类型制定" id="child3_1"/>
								</sx:treenode>
								<sx:treenode label="品牌网格账户" id="root">
									<sx:treenode label="全部账户" id="child3_2" />
									<sx:treenode label="添加账户" id="child3_3" />
								</sx:treenode>
								<sx:treenode label="公告栏管理" id="root">
									<sx:treenode label="公告栏信息" id="child3_4" />
								</sx:treenode>
								<sx:treenode label="售货员管理" id="root">
									<sx:treenode label="售货员信息" id="child3_5" />
								</sx:treenode>
								<sx:treenode label="格子管理" id="root">
									<sx:treenode label="格子信息" id="child3_6" />
								</sx:treenode>
								<sx:treenode label="格主管理" id="root">
									<sx:treenode label="格主信息" id="child3_7" />
								</sx:treenode>
								<sx:treenode label="商品管理" id="root">
									<sx:treenode label="商品信息" id="child3_8"/>
								</sx:treenode>
								<sx:treenode label="优惠信息管理" id="root">
									<sx:treenode label="优惠信息" id="child3_9"/>
								</sx:treenode>
								<sx:treenode label="销售记录管理" id="root">
									<sx:treenode label="销售记录" id="child3_10"/>
								</sx:treenode>
								<sx:treenode label="业绩分析管理" id="root">
									<sx:treenode label="业绩分析" id="child3_11"/>
								</sx:treenode>
							</sx:tree>
						 </div>
						 <div class="hide">
							 <sx:tree label="注册用户" templateCssPath="/struts/tree.css"
								showRootGrid="true" showGrid="true" treeSelectedTopic="treeSelected"
								disabled="" collapsedNotifyTopics="" id="root">
								<sx:treenode label="用户信息" id="root">
									<sx:treenode label="所有用户信息" id="child4_1"/>
								</sx:treenode>
							</sx:tree>
						 </div>
					</div>
				</div>
                </div>
                <div id="content2">
                    <iframe name="rightIframe" frameborder="0" id="rightIframe">
                    
                    </iframe>
                </div>
            </div>
            <div id="footer">
                <div id="footer1">
                    |关于我们|广告服务|提交问题|版权声明|关于隐私|合作伙伴| 
                </div>
                <div id="footer2">
                    Copyright @ 2011 网格
                </div>
            </div>
        </center>
    </div>
    </form>
</body>
  <script language="JavaScript">
   window.onload=function(){ 
		var nodes =dojo.widget.manager.getWidgetsByType('struts:StrutsTreeNode'); 
		for( var i=0; i < nodes.length; i++){ 
	    	nodes[i].expand(); 
		} 
	}
  </script>
</html>
