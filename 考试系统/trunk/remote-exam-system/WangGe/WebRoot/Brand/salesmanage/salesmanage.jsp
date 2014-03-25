<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<script src="${pageContext.request.contextPath}/Brand/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/lanmu.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Brand/js/clock.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('#shijian').jclock({ withDate: true })
    })
    var url = top.location.href;
    	var url2 = "http://${header['host']}${pageContext.request.contextPath}/Brand/salesmanage/salesmanage.jsp";
    	if(url != url2){
    		top.location.href = "${pageContext.request.contextPath}/Brand/salesmanage/salesmanage.jsp";
    	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>品牌店售货员管理后台</title>
<link href="${pageContext.request.contextPath}/Brand/css/shouhuohoutai-css.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/css/shouhuohoutai-div.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="box">
    <div id="top"><div id="top1" class="top"></div>
                  <div id="top2" class="top"><div id="tuichu" class="ziti1" align="right">
                  <s:url id="url" action="exit_salesowner">
					</s:url>
			<s:a href="%{url}" method="post">[退出]</s:a>
                  </div>
				                             <div id="huanying" class="ziti1" align="right"><span>[<s:property value="#session.sales_username"/>]</span><span>欢迎您！</span><span>登陆时间为:</span><div id="shijian"></div>
											 </div>
			      </div>
    </div>
	<div id="zhuti">
	<div id="zuoshang1"></div>
	<div id="zhong1"></div>
	<div id="youshang1"></div>
	<div id="zhong2"></div>
	<div id="zhong"><div id="daohang"><div id="daohang1"></div>
	                                  <div id="daohang2"><dl class="submenu"><dt><a href="${pageContext.request.contextPath}/Brand/salesmanage/jiesuan.jsp" target="siframe" class="childmenu">出售模块</a></dt></dl>
									                     <dl class="submenu"><dt>
									                     	<s:url id="url" action="showAllGrid_by_page_owner">
									                     	<s:param name="owner_status">1</s:param>
															</s:url>
															<s:a href="%{url}" method="post" target="siframe" cssClass="childmenu">全部格子</s:a>
									                     </dt></dl>
                                                         <dl class="submenu"><dt>商品管理</dt>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_brandOwner">
                                                                      	<s:param name="issalesmanage">yes</s:param>
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">5</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}" target="siframe" cssClass="childmenu">当前上架商品</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                       <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="owner_status">1</s:param>
																		<s:param name="statu_choice">1</s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																		<s:param name="issalesmanage">yes</s:param>
																	    </s:url>
																		<s:a href="%{url}" target="siframe" cssClass="childmenu">审批上架商品</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="owner_status">1</s:param>
																		<s:param name="statu_choice">2</s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																		<s:param name="issalesmanage">yes</s:param>
																	    </s:url>
																		<s:a href="%{url}" target="siframe" cssClass="childmenu">审批下架商品</s:a>
                                                                      </dd>
																	  <dd>
																	   <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">6</s:param>
																		<s:param name="issalesmanage">yes</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}" target="siframe" cssClass="childmenu">已下架商品</s:a>
																	  </dd>
																	  <dd>
																	  <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">7</s:param>
																		<s:param name="issalesmanage">yes</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}" target="siframe" cssClass="childmenu">旧库存</s:a>
																	  </dd>
                                                                      </dl>
                                                         <dl class="submenu"><dt>格子优惠信息</dt>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Prefere_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">7</s:param>
																		<s:param name="issalesmanage">yes</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}"  target="siframe" cssClass="childmenu">当前上架优惠信息</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                       <s:url id="url" action="show_All_Prefere_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">2</s:param>
																		<s:param name="issalesmanage">yes</s:param>
																		<s:param name="owner_status">1</s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	</s:url>
																	<s:a href="%{url}" target="siframe" cssClass="childmenu">审批上架优惠信息</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Prefere_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">1</s:param>
																		<s:param name="issalesmanage">yes</s:param>
																		<s:param name="owner_status">1</s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	</s:url>
																	<s:a href="%{url}" target="siframe" cssClass="childmenu">审批下架优惠信息</s:a>
                                                                      </dd>
																	  <dd>
																	  <s:url id="url" action="show_All_Prefere_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">8</s:param>
																		<s:param name="issalesmanage">yes</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}"  target="siframe" cssClass="childmenu">已下架优惠信息</s:a>
																	  </dd>
                                                                      </dl>
														 <dl class="submenu"><dt><a href="${pageContext.request.contextPath}/Brand/salesmanage/xiaoshoujilu-top.jsp" target="siframe" class="childmenu">销售记录</a></dt></dl>
                                      <dl class="submenu"><dt><a href="${pageContext.request.contextPath}/Brand/showOther/2.jsp" target="blank" class="childmenu">打印销售记录</a></dt></dl>
                                      </div>
									  <div id="daohang3"></div>
	                </div>
					<div id="weizhi" class="ziti3">当前位置</div>
					<div id="right"><div id="xuxian1"></div>
					                <div id="xuxian2"></div>
									<div id="xuxian3"></div>
                                    <div id="content"><iframe id="siframe" name="siframe" frameborder="0" src="" allowtransparency="ture"></iframe></div>
                                    <div id="xuxian4"></div>
                                    <div id="xuxian5"></div>
                                    <div id="xuxian6"></div>
					</div>
	</div>
	<div id="zhong3"></div>
	<div id="zuoxia1"></div>
	<div id="zhong4"></div>
	<div id="youxia1"></div>
	</div>   
</div>
<div id="bottom"> Copyright ? 2012 网格</div>
</body>
</html>
