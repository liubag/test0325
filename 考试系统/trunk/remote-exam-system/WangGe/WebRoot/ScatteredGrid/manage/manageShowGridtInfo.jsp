<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生网格后台管理</title>

<link href="${pageContext.request.contextPath}/ScatteredGrid/css/showallaccountpage.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ScatteredGrid/js/showallaccountpage.js" type="text/javascript"></script>
</head>

<body>
  <s:form method="post" action="update_user_scatteredGrid">
  
	  <table width="650" id="table1" cellspacing="0">
		  <tr>
		    <th width="150">格子名称：</th>
		    <td width="500" >
		    <div id="box1">
		    	<div id="shang"><s:property value="scatteredGrid.grid_name"/></div>
				
			    <div id="xia" class="abc">
			    <s:if test="tip1==null">
			    		<s:textfield name="scatteredGrid.grid_name" id="gridname" maxlength="15"/>（15字内）
					</s:if>
					<s:else>
						 <s:textfield name="girdname" id="gridname" maxlength="15"/>
						 <s:text name="tip1" />	 	
					</s:else> 
			   	    <s:hidden id="tipdd" name="tip1"/>
			    </div> 
				<input id="btn" type="button" value="修改" />   
			</div>
			
		    </td>
		  </tr>
		  <tr>
		    <th width="133">主人：</th>
		   	<td width="149"><s:text name="scatteredGridUser.truename"/></td>
		  </tr>
		  <tr>
		    <th>联系电话：</th>
		    <td>
		    <div id="box1">
			    <div id="shang2">
				  	<s:text name="scatteredGridUser.phone"/>
			    </div>
			    <div id="xia2" class="abc">
			    	<s:textfield name="scatteredGridUser.phone" id="phone" maxlength="15"/>
			    </div>
			    <input id="btn2" type="button" value="修改" />
			</div>
		    
		    </td>
		  </tr>
		  <tr>
		    <th>地址：</th>
		    <td>
		    <div id="box1">
			    <div id="shang3">
				  	<s:text name="scatteredGridUser.address"/>
			    </div>
			    <div id="xia3" class="abc">
			    	<s:textfield name="scatteredGridUser.address" id="address" maxlength="30" size="40"/>(30字以内)
			    </div>
			    <input id="btn3" type="button" value="修改" />
			</div>
		    </td>
		  </tr>
		  <tr>
		    <th>提示：</th>
		    <td height="100px" valign="top">
		    <div id="box1">
			    <div id="shang4">
				  	<s:text name="scatteredGridUser.tipInfo"/>
			    </div>
			    <div id="xia4" class="abc">
			    	<s:textarea name="scatteredGridUser.tipInfo" cols="40" rows="3" id="tipinfo" onkeyup="return goodsinfokeyup();"/><span id="wordcount">0/50字</span>
			    </div>
			    <input id="btn4" type="button" value="修改" />
			</div>
		    </td>
		  </tr>
		  <tr>
		    <th>
		    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<s:property value="scatteredGridUser.qq_number"/>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<s:property value="scatteredGridUser.qq_number"/>:41" alt="点击这里给我发消息" title="点击这里给我发消息" /></a>
		    </th>
		    <td>
		    <div id="box1">
			    <div id="shang5">
				  	<s:text name="scatteredGridUser.qq_number"/>
			    </div>
			    <div id="xia5" class="abc">
			    	<s:textfield name="scatteredGridUser.qq_number" id="qq_number" maxlength="13" size="30"/>
			    </div>
			    <input id="btn5" type="button" value="修改" />
			</div>
		    </td>
		  </tr>
		  
		  <tr>
		    <th>总评分：</th>
		    <td><s:text name="scatteredGrid.rendtype_evaluation" /></td>
		  </tr>
		  <tr>
			  <th valign="top">优惠信息：</th>
			  <td height="100px" valign="top">
			  <s:if test="scatteredGridPreferential==null">
			  		----
			  </s:if>
			  <s:else>
			 	<s:text name="scatteredGridPreferential.preferential_text" />
			  </s:else> 
			  </td>
		  </tr>
		</table>
		
		<div id="div_sure"><s:submit value="确定修改" onclick="return check();"/></div>
	</s:form>
</body>
</html>