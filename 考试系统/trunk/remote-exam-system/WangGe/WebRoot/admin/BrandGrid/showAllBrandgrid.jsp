<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s"%>

<html>
<head>
	<title></title>
	<link href="${pageContext.request.contextPath}/admin/css/dialog.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/admin/js/jquery-latest.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/dialog.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/jquery-1.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/admin/js/table_tr.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/admin/css/table_tr.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div >
  <div id="zhuanghu" align="center">
  	<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript">
	
		$(function(){
	
			var height = $("body").height();
			$("#rightIframe",parent.document.body).height(height + 50);
			var tip = $("#tip").val();
			if(tip != "" || tip .length > 0){
				alert(tip);
			}
		})
	
		var page = <%=page01 %>;
		var hasPages = <%=hasPages%>;
		
		function justUpPage(){
			if(page == hasPages){
				 alert("已经是最后一页了！");
				 return false;
			}	 
		}
		
		function justNextPage(){
			if(page == 0 || page == 1){
				 alert("已经是第一页了！");
				 return false;
			}	 
		}
		function test(select){
	  		$("#rightIframe",parent.document.body).attr("src","showAllBrandgrid.do?page="+select.value );
	  	}
	  	
	  	function forcedo_zhuxiao(){
		    if(!confirm('是否确定注销操作？')){return false;}
		    return true;
		}
	  	
	</script>
		<table>
			
		</table>
		<br/>
		<input type="hidden" id="tip" value="<s:property value="tip"/>"/>
		<table id="table2">
			<thead>
				<tr><th style="text-align: center;">品牌店店名</th><th style="width: 100px;text-align: center;">地址</th><th style="text-align: center;">客服QQ</th><th style="text-align: center;">绑定登录ip</th><th style="text-align: center;">拥有格子数</th><th style="text-align: center;">入驻时间</th><th style="text-align: center;">租用时间</th><th style="text-align: center;">租用开始</th><th style="text-align: center;">租用结束</th><th style="width: 100px;text-align: center;">格子类型</th><th style="width: 180px;text-align: center;">法人信息</th><th style="text-align: center; width: 80px;">状态</th><th style="text-align: center; width: 150px;">操作</th></tr>
			</thead>
			<tbody>
		  	<s:iterator value="brandgrid_l" status="st">
		  		<tr>
		  		<td><s:property value="brandgrid_name"/></td>
		  		<td><s:property value="brandgrid_address"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_qq"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_ip"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_hasgrids"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_newtime.toLocaleString()"/></td>
		  		<td style="text-align: center;"><s:property value="hireTime"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_starttime.toLocaleString()"/></td>
		  		<td style="text-align: center;"><s:property value="brandgrid_endtime.toLocaleString()"/></td>
		  		<td style="text-align: center;">
		  		<a href="#" onclick='dialog("格子类型","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/admin/BrandGrid/dialog_gridType.jsp?gn=<s:property value="brandgridGridtype.brandgrid_gridtype_name"/>&csg=<s:property value="brandgridGridtype.can_show_goods"/>&u=<s:property value="brandgridGridtype.unitprice"/>&hds=<s:property value="brandgridGridtype.hard_disk_space"/>&lz=<s:property value="brandgridGridtype.LZ_note"/>","450px","200px","iframe"); '><s:property value="brandgridGridtype.brandgrid_gridtype_name"/></a>
		  		</td>
		  		<td style="text-align: center;">
		  		<a href="#" onclick='dialog("品牌店法人信息","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/admin/BrandGrid/dialog_owner.jsp?on=<s:property value="brandgridOwner.brandgrid_owner_name"/>&os=<s:property value="brandgridOwner.brandgrid_owner_sex"/>&op=<s:property value="brandgridOwner.brandgrid_owner_phone"/>","450px","200px","iframe"); '><s:property value="brandgridOwner.brandgrid_owner_name"/></a>
		  		</td>
		  		<td style="text-align: center;">
			  		<s:if test="brandgrid_status==1">
				  		正常
				  	</s:if>
				  	<s:else>
				  		已注销<br/>
				  		(<s:property value="brandgrid_outtime"/>)
				  	</s:else>
		  		</td>
		  		<td style="text-align: center;">
					<s:if test="brandgrid_status==1">
				  		<s:url id="url" action="brandgrid_zhuxiao">
							<s:param name="brandgrid_id"><s:property value="brandgrid_id"/></s:param>
						</s:url>
						<s:a href="%{url}" method="post" onclick="return forcedo_zhuxiao();">注销</s:a>
				  		<br/>
				  		<a href="#" onclick='dialog("续约","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/admin/BrandGrid/dialog_xuyue.jsp?gn=<s:property value="brandgrid_name"/>&guuid=<s:property value="brandgrid_id"/>&page=<s:property value="page"/>","450px","150px","iframe"); '>续约</a>
				  		<br/>
				  		<s:url id="url" action="findBrandgrid_admin">
						<s:param name="brandgrid_id"><s:property value="brandgrid_id"/></s:param>
						</s:url>
						<s:a href="%{url}" method="post">修改基本信息 </s:a>	
						<br/>
						<s:url id="url" action="showGrids_All">
							<s:param name="brandgrid_id"><s:property value="brandgrid_id"/></s:param>
						</s:url>
						<s:a href="%{url}" method="post">修改格子数量</s:a>
				  	</s:if>
				  	<s:else>
				  		<a href="#" onclick='dialog("激活","iframe:<s:text name="mylocalhosturl" />${pageContext.request.contextPath}/admin/BrandGrid/dialog_jihuo.jsp?gn=<s:property value="brandgrid_name"/>&guuid=<s:property value="brandgrid_id"/>&page=<s:property value="page"/>","450px","150px","iframe"); '>激活</a>
				  	</s:else>
			  	</td>
		  		</tr>
		  	</s:iterator>
		</tbody>
		</table>
		
		<table width="680" border="0" cellspacing="10" cellpadding="10">
			<tr>
			<td align="center"><s:property value="page"/>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllBrandgrid">
			        <s:param name="page">1</s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllBrandgrid">
			        <s:param name="page"><s:property value="page-1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllBrandgrid">
			        <s:param name="page"><s:property value="page+1"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllBrandgrid">
			        <s:param name="page"><s:property value="hasPages"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="hasBrandgrids"/>条记录
			</td>
			</tr>
		</table>
		</div>
</div>
</body>
</html>
