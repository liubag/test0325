<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/Brand/css/yejifengxi.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/Brand/js/yejifengxiJs.js" type="text/javascript"></script>


</head>

<body>
<div id="top">
<span id="zhou"><a href="#" onclick="return szhou();">按最近三周分析</a></span>
<span id="yue"><a href="#" onclick="return syue();">按最近三月分析</a></span>
</div>
<div id="top">
	<div id="z">
		<div class="shijian_left">
			<a href="#" id="zup" onclick="return zup();">往前一周</a>
		</div>
		<div class="shijian_min">
		</div>
		<div class="shijian_right">
			<a href="#" id="zdown" onclick="return zdown();">往下一周</a>
		</div>
	</div>	
	<div id="y" style="display:none;">
		<div class="shijian_left">
		<a href="#" id="yup" onclick="return yup();">往前一个月</a>
		</div>
		<div class="shijian_min">
		</div>
		<div class="shijian_right">
		<a href="#" id="ydown" onclick="return ydown();">往下一个月</a>
		</div>
	</div>
</div>
<div id="baobiao">
<iframe id="fengxi" src=""></iframe>
</div>
<div id="myDialog" title="My Dialog" style="display:none;text-align:center; padding-top: 100px;">  
			<div style="margin-bottom: 30px;">数据正在分析，请稍后...</div>
			<div>  
				<img alt="" src="../pic/empty_180_180.gif"/> 
			</div>   
	</div>  
<div id="fail_for" title="My Dialog" style="display:none;text-align:center; padding-top: 100px;">  
			<div style="margin-bottom: 30px;" id="waiting"></div>
			<div>  
			</div>   
	</div>  
</body>
</html>
