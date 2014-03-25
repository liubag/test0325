<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%
			boolean isStudent = session.getAttribute("student_permission") == null ? false
					: true;
			boolean isTeacher = session.getAttribute("teacher_permission") == null ? false
					: true;
			boolean isAdmin = session.getAttribute("admin_permission") == null ? false
					: true;
			boolean isTologin = request.getAttribute("isTologin") == null ? false
					: true;		
			
		%>
		<title>系统登录</title>
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/js/jquery-easyui-1.2.1/themes/icon.css"></link>
		<link
			href="<%=request.getContextPath()%>/js/jquery-easyui-1.2.1/themes/default/easyui.css"
			rel="stylesheet" type="text/css" />
		
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/jquery-easyui-1.2.1/locale/easyui-lang-zh_CN.js"
			type="text/javascript"></script>
		<script
			src="<%=request.getContextPath()%>/js/jquery-easyui-1.2.1/jquery.easyui.min.js"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.blockUI.js"></script>
		<script language="javascript">
   		$(document).ready(function(){
  			
   			var isStudent =<%=isStudent%>;
   			var isTeacher =<%=isTeacher%>;
   			var isAdmin =<%=isAdmin%>;
   			var isTologin=<%=isTologin%>;
   			if(isTologin){  			
   				$.blockUI({    //当点击事件发生时调用弹出层
            		message: $('#code_box'),    //要弹出的元素box
             		css: {    //弹出元素的CSS属性
                 		top: '40%',
		 			 	left: '60%',
		 				textAlign: 'center',
		 		 		marginLeft: '-320px',
		 		 		marginTop: '-145px',
                 		width: '300px',
                 		opacity: 0.5,
                 		background: '#000'
                 		
            		}
        		});
				$('.blockOverlay').attr('title','单击关闭').click($.unblockUI);   //遮罩层属性的设置以及当鼠标单击遮罩层可以关闭弹出层
				$('.close').click($.unblockUI);  //也可以自定义一个关闭按钮来关闭弹出				
   		}
   			
   			
   			var options = {
   				 title: "操作提示",
	             msg: "已经登录，无需重新登录！",
	             showType: 'slide',
	             timeout: 2000
   			};
   			if(isStudent){
   				$.messager.show(options);
   				top.location.href="http://localhost:8080/ASP_System/showExam.do";
   			}else if(isTeacher){
   				$.messager.show(options);
   				top.location.href="http://localhost:8080/ASP_System/teacher/yueJuan.jsp";
   			}else if(isAdmin){
   				$.messager.show(options);
   				top.location.href="http://localhost:8080/ASP_System/admin/admin_default.jsp";
   			}
   		
   			$("#loginForm").submit(function(){
	   			if($("input:radio[name=userType]:checked").val()==2){
	   				$("#loginForm").attr("action","teacherLogin.do");
	   				return true;
	   			}else if($("input:radio[name=userType]:checked").val()==3){
	   				$("#loginForm").attr("action","adminLogin.do");
	   				return true;
	   			}	
   			});  			
   			
   		});
   		
   	</script>
		<style type="text/css">
font {
	font-family: "宋体";
	font-size: 9pt;
	color: #333333;
}

input {
	font-family: "宋体";
	font-size: 9pt;
	color: #333333;
}

.td1 {
	text-align: right;
	width: 50%;
}

.td2 {
	text-align: left;
	width: 50%;
}

.td3 {
	text-align: center;
}
</style>
	</head>

	<body>
		<form id="loginForm" style="align: center;" method="post"
			action="userLogin.do">
			<table width="100%">
				<tr>
					<td class="td1">
						<font>用户名：</font>
					</td>
					<td class="td2">
						<input type="text" id="account" name="account" />
					</td>
				</tr>
				<tr>
					<td class="td1">
						<font>密码：</font>
					</td>
					<td class="td2">
						<input type="password" id="pw" name="pw" />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="td3">
						<input type="radio" name="userType" value="1" checked />
						<font>学生</font>
						<input type="radio" name="userType" value="2" />
						<font>教师</font>
						<input type="radio" name="userType" value="3" />
						<font>管理员</font>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" id="login" value="登录" />
						&nbsp;&nbsp;&nbsp;
						<input type="reset" value="重置">
					</td>
				</tr>
			</table>

		</form>
	<div id="code_box" style="display:none ">
		你的用户名和密码不正确<br>请重新登录
	</div>
	</body>
</html>
