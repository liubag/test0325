<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>其他优惠状态</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
		function dele(){
			if(!confirm('是否确定删除操作？')){return false;}
		     return true;
		}
		function quxiao(){
			if(!confirm('是否确定取消申请操作？')){return false;}
		     return true;
		}
		function chongxin(){
			if(!confirm('优惠折扣商品有可能已下架，是否确定重新申请操作？')){return false;}
		     return true;
		}
        function refreshSize() {
        var owner_status = $("#owner_status").val(); 
        var tip = $("#tip").val();
        if(owner_status == '1'){
                  $("#shenqingzhong").attr("class","yes");
                  $("#tongguoyishangjia").attr("class","no");
				  $("#butongguo").attr("class","no");
				  $("#shenqingyiguoqi").attr("class","no");
                           }else if(owner_status == '2'){
                                $("#shenqingzhong").attr("class","no");
                                $("#tongguoyishangjia").attr("class","yes");
								$("#butongguo").attr("class","no");
				                $("#shenqingyiguoqi").attr("class","no");
                           }else if(owner_status == '3'){
                                $("#shenqingzhong").attr("class","no");
                                $("#tongguoyishangjia").attr("class","no");
								$("#butongguo").attr("class","yes");
				                $("#shenqingyiguoqi").attr("class","no");
                           }else if(owner_status == '4'){
                                $("#shenqingzhong").attr("class","no");
                                $("#tongguoyishangjia").attr("class","no");
								$("#butongguo").attr("class","no");
				                $("#shenqingyiguoqi").attr("class","yes");
                           }
                           if(tip.length > 0){
                           	   alert(tip);
                           }
                    } 
</script>
<style type="text/css">
#fengye td{
	height: 10px;
}
</style>
<link href="${pageContext.request.contextPath}/Brand/css/qitayouhuizhuangtai.css" rel="stylesheet" type="text/css" />
</head>

<body onload="refreshSize()">
<s:if test="lz!=null && lz>=0">
<div>今天还有<s:property value="lz"/>次置顶机会</div>
</s:if>
<input type="hidden" id="tip" value="<s:property value="tip"/>"/>
<input type="hidden" id="owner_status" value="<s:property value="owner_status"/>"/>
<div id="top">
         <span id="shenqingzhong">
         <s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">1</s:param>
		</s:url>
		<s:a href="%{url}">申请中</s:a>
         </span>
		 <span id="tongguoyishangjia">
		 <s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">2</s:param>
		</s:url>
		<s:a href="%{url}">通过已上架</s:a>
		 </span>
		 <span id="butongguo">
		 <s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">3</s:param>
		</s:url>
		<s:a href="%{url}">不通过</s:a> 
		 </span>
		 <span id="shenqingyiguoqi">
		 <s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status">4</s:param>
		</s:url>
		<s:a href="%{url}">申请已过期</s:a> 
		</span>
</div>
<table cellspacing="0">
  <tr>
    <s:if test="owner_status==1">
    <td width="11%" class="td2">申请时间</td>
    <td width="12%" class="td2">过期时间</td>
    </s:if>
    <s:elseif test="owner_status==2">
    <td width="12%" class="td2">上架时间</td>
    <td width="12%" class="td2">操作(过期)时间</td>
    </s:elseif>
    <s:elseif test="owner_status==3">
    <td width="12%" class="td2">申请时间</td>
    <td width="12%" class="td2">操作时间</td>
    </s:elseif>
    <s:elseif test="owner_status==4">
    <td width="12%" class="td2">申请时间</td>
    <td width="12%" class="td2">过期时间</td>
    </s:elseif>
    <td width="59%" class="td2">优惠信息</td>
    <td width="8%" class="td2">状态</td>
    <td width="8%" class="td2">操作</td>
  </tr>
  <s:iterator value="brandgridPreferential_l" status="st">
  <tr>
   
    <s:if test="owner_status==1">
    <td class="td3"><s:property value="brandgrid_preferential_sqtime.toLocaleString()"/></td>
    <td class="td3"><s:property value="brandgrid_preferential_outtime.toLocaleString()"/></td>
    </s:if>
    <s:elseif test="owner_status==2">
    <td class="td3"><s:property value="brandgrid_preferential_uptime.toLocaleString()"/></td>
    <td class="td3">
    <s:if test="brandgrid_preferential_status==1">
    <s:property value="brandgrid_preferential_outtime.toLocaleString()"/>
    </s:if>
    <s:elseif test="brandgrid_preferential_status==4">
    <s:property value="brandgrid_preferential_outtime.toLocaleString()"/>
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==6">
    <s:property value="brandgrid_preferential_maksuretime.toLocaleString()"/>
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==7">
    <s:property value="brandgrid_preferential_uptime.toLocaleString()"/>
    </s:elseif>
    </td>
    </s:elseif>
    <s:elseif test="owner_status==3">
    <td class="td3"><s:property value="brandgrid_preferential_sqtime.toLocaleString()"/></td>
    <td class="td3"><s:property value="brandgrid_preferential_maksuretime.toLocaleString()"/></td>
    </s:elseif>
    <s:elseif test="owner_status==4">
    <td class="td3"><s:property value="brandgrid_preferential_sqtime.toLocaleString()"/></td>
    <td class="td3"><s:property value="brandgrid_preferential_outtime.toLocaleString()"/></td>
    </s:elseif>
     <td class="td4">
     &nbsp;&nbsp;&nbsp;&nbsp;<s:property value="brandgrid_preferential"/>
     <s:if test="brandgrid_qcStatus==1">
     {{全场优惠：<s:property value="brandgrid_qcZK"/> 折扣}}
     </s:if>
     <s:elseif test="brandgrid_zhekou.length() > 0 && brandgrid_qcStatus==0">
     	{{折扣优惠：<s:property value="brandgrid_zhekou" escape="false"/> }}
     </s:elseif>
     </td>
      <td class="td3">
    <s:if test="brandgrid_preferential_status==1">
    	申请下架
    </s:if>
    <s:elseif test="brandgrid_preferential_status==2">
    	申请上架
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==3">
    	申上过期
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==4">
    	申下过期
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==5">
    	申上失败
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==6">
    	申下失败
    </s:elseif>
    <s:elseif test="brandgrid_preferential_status==7">
    	已上架
    </s:elseif>
    </td>
    <td class="td3">
    	<s:if test="brandgrid_preferential_status==1 || brandgrid_preferential_status==2">
    		<p>
    		<s:url id="url" action="quxiaoPre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}"  onclick="return quxiao();">取消申请</s:a>
    		</p>
    		<p>
    		 <s:url id="url" action="delePre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}"  onclick="return dele();">删除</s:a>
    		</p>
    		<p>
    		<s:url id="url" action="findPreUpata_grid">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
			</s:url>
			<s:a href="%{url}">修改</s:a>
    		</p>
	    </s:if>
	    <s:elseif test="brandgrid_preferential_status==3 || brandgrid_preferential_status==5">
	    	<s:if test="isCanAdd==1">
	    	<p>
	    	<s:url id="url" action="chongxinPre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}" onclick="return chongxin();">重新申请</s:a>
	    	</p>
	    	</s:if>
	    	<p>
	    	<s:url id="url" action="delePre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}"  onclick="return dele();">删除</s:a>
	    	</p>
	    	<p>
    		<s:url id="url" action="findPreUpata_grid">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
			</s:url>
			<s:a href="%{url}">修改</s:a>
    		</p>
	    </s:elseif>
	    <s:elseif test="brandgrid_preferential_status==4  || brandgrid_preferential_status==6">
	    	<p>
	    	<s:url id="url" action="chongxinPre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}" onclick="return chongxin();">重新申请</s:a>
	    	</p>
	    	<p>
	    	<s:url id="url" action="delePre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}"  onclick="return dele();">删除</s:a>
	    	</p>
	    	<p>
    		<s:url id="url" action="findPreUpata_grid">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
			</s:url>
			<s:a href="%{url}">修改</s:a>
    		</p>
	    </s:elseif>
	    <s:elseif test="brandgrid_preferential_status==7">
	    	<p>
	    	<s:url id="url" action="sxiajiaPre_girdOwner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}"  onclick="return quxiao();">申请下架</s:a>
	    	</p>
	    </s:elseif>
	    <s:if test="sure_status==7 && lz>0 && (LZ_datetime.toLocaleString()).split(' ')[0] != lz_u_time">
	    <p>
	    <s:url id="url" action="zhidingPre_gridowner">
    		 	<s:param name="brandgrid_preferential_id"><s:property value="brandgrid_preferential_id"/></s:param>
				<s:param name="page"><s:property value="page"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			</s:url>
			<s:a href="%{url}">置顶</s:a>
		</p>
	    </s:if>
    </td>
  </tr>
    </s:iterator>
    <tr>
      <td class="td5">&nbsp;</td>
      <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
    <td class="td5">&nbsp;</td>
  </tr>
</table>
<s:if test="owner_status!=null">


<%
		Integer page01 = (Integer)request.getAttribute("page");
		Integer hasPages = (Integer)request.getAttribute("hasPages");
	 %>
	<script type="text/javascript">
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
		
		
		function zhuxiao(){
			
		}
		
		function test(select){
			var owner_status = $("#owner_status").val();
	  		$("#iframe",parent.document.body).attr("src","showAllPre_page_gridowner.do?page="+select.value+"&owner_status="+owner_status);
	  	}
	  	
	</script>

<table id="fengye" width="100%" border="0">
			<tr>
			<td align="center"><span id="page2"><s:property value="page"/></span>/<s:property value="hasPages"/></td>
			<td align="center">
				<s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page">1</s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			    </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">第一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page"><s:property value="page-1"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
			   </s:url>
				<s:a href="%{url}" onclick="return justNextPage();">上一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page"><s:property value="page+1"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">下一页</s:a>
			</td>
			<td align="center">
				<s:url id="url" action="showAllPre_page_gridowner">
				<s:param name="page"><s:property value="hasPages"/></s:param>
				<s:param name="owner_status"><s:property value="owner_status"/></s:param>
				</s:url>
				<s:a href="%{url}" onclick="return justUpPage();">最后一页</s:a>
			</td>
			<td align="center">
			跳转<s:select list="page_l" name="page" onchange="test(this);"/>
			</td>
			<td align="center">
			共有<s:property value="has"/>条记录
			</td>
			</tr>
		</table>
		</s:if>
</body>
</html>
