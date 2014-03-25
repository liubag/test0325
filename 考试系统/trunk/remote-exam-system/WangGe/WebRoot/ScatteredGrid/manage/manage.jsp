<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>学生网格管理</title>
    <script language="JavaScript">
    	var url = top.location.href;
    	var url2 = "http://${header['host']}${pageContext.request.contextPath}/ScatteredGrid/manage/manage.jsp";
    	if(url != url2){
    		top.location.href = "${pageContext.request.contextPath}/ScatteredGrid/manage/manage.jsp";
    	}
	</script>
    <script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/ScatteredGrid/js/jquery_cookie.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/ScatteredGrid/js/manage.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/ScatteredGrid/css/manage.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1">
    <div id="main">
        <center>
            <div id="header">
                <div id="header1">
              	  	你好！<s:property value="#session.username"/>，
              	  	<s:url id="url" action="exit">
					</s:url>
					<s:a href="%{url}" method="post">安全退出</s:a>
                </div>
                <div id="header2">
                </div>
            </div>
            <div id="nav">
                <div id="nav1">
                    <span>当前位置：</span>
                </div>
            </div>
            <div id="content">
                <div id="content1">
                    <dl class="submenu">
                        <dt>个人中心</dt>
                        <dd>
                        	<s:url id="url" action="showGridAccountAllInfo">
							</s:url>
					  		<s:a href="%{url}" method="post" target="rightIframe">账户信息</s:a>
                        </dd>
                        <dd>
                        	<s:a href="/WangGe/ScatteredGrid/manage/manageUpdateLoginInfo.jsp" method="post" target="rightIframe">修改登录信息</s:a>
                        </dd>
                    </dl>
                    <dl class="submenu">
                        <dt>格子管理</dt>
                        <dd>
                        	<s:url id="url" action="showGridAllInfo_user1">
							</s:url>
					  		<s:a href="%{url}" method="post" target="rightIframe">格子信息</s:a>
                        </dd>
                        <dd>
                            <a href="#" class="menuChild">格子铺位图片</a>
                        </dd>
                        <dd>
                        	<s:url id="url" action="showAllPreferential_user">
						 		<s:param name="page">1</s:param>
							</s:url>
							<s:a href="%{url}" method="post" target="rightIframe">优惠信息</s:a>
                        </dd>
                    </dl>
                    <dl class="submenu">
                        <dt>商品管理</dt>
                        <dd>
                        	<s:a href="/WangGe/ScatteredGrid/manage/manageUploadGoods.jsp" method="post" target="rightIframe">上传商品</s:a>
                        </dd>
                        <dd>
                        	<s:url id="url" action="showAllExhibitGoods">
							</s:url>
					  		<s:a href="%{url}" method="post" target="rightIframe">在架商品</s:a>
                        </dd>
                        <dd>
                            <s:url id="url" action="showAllGoods_by_page_user">
						 	<s:param name="page">1</s:param>
						 	<s:param name="goodstatu">1</s:param>
							</s:url>
							<s:a href="%{url}" method="post" target="rightIframe"> 全部商品</s:a>
                        </dd>
						 <dd>
						 	<s:url id="url" action="showDoGoodsNote_by_page">
						        <s:param name="page">1</s:param>
						        <s:param name="time"></s:param>
							</s:url>
							<s:a href="%{url}" method="post" target="rightIframe">商品售出记录</s:a>
                        </dd>
                    </dl>
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
</html>
