<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
    	var url2 = "http://${header['host']}${pageContext.request.contextPath}/Brand/brandmanage/brandmanage.jsp";
    	if(url != url2){
    		top.location.href = "${pageContext.request.contextPath}/Brand/brandmanage/brandmanage.jsp";
    	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>品牌店店主管理后台</title>
<link href="${pageContext.request.contextPath}/Brand/css/brandmanage-css.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/css/brandmanage-div.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="box">
    <div id="top"><div id="top1" class="top"></div>
                  <div id="top2" class="top"><div id="tuichu" class="ziti1" align="right">
              	  	<s:url id="url" action="exit_brandowner">
					</s:url>
			<s:a href="%{url}" method="post">[退出]</s:a>
                  </div>
				                             <div id="huanying" class="ziti1" align="right"><span>[<s:property value="#session.truename"/>] </span>  <span> 欢迎您！</span><span>登陆时间为:</span><div id="shijian" class="ziti1"></div>
											 </div>
			      </div>
    </div>
	<div id="zhuti">
	<div id="zuoshang1"></div>
	<div id="zhong1"></div>
	<div id="youshang1"></div>
	<div id="zhong2"></div>
	<div id="zhong"><div id="daohang"><div id="daohang1"></div>
	                                  <div id="daohang2"><dl class="submenu">
	                                  <dt><a href="${pageContext.request.contextPath}/Brand/brandmanage/gridInfo.jsp" target="iframe" class="childmenu">店Logo图片</a></dt>
	                                  </dl>
	                                  <dl class="submenu">
	                                  <dt>商品管理</dt>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">5</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}" target="iframe" cssClass="childmenu">当前上架商品</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="owner_status">1</s:param>
																		<s:param name="statu_choice">1</s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}" target="iframe" cssClass="childmenu">审批上架商品</s:a>
                                                                     </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="owner_status">1</s:param>
																		<s:param name="statu_choice">2</s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}" target="iframe" cssClass="childmenu">审批下架商品</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">6</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}" target="iframe" cssClass="childmenu">已下架商品</s:a>
																		</dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">7</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}" target="iframe" cssClass="childmenu">旧库存</s:a>
                                                                      </dd>
                                                                      </dl>
                                                         <dl class="submenu"><dt>格子管理</dt>
                                                                      <dd>
                                                                      <s:url id="url" action="showAllGrid_by_page_owner">
																		</s:url>
																		<s:a href="%{url}" method="post" target="iframe" cssClass="childmenu">分布图</s:a>
                                                      					</dd>
                                                                      <dd><a href="${pageContext.request.contextPath}/Brand/brandmanage/tianjiagezhu.jsp" target="iframe" class="childmenu">添加格主</a></dd>
                                                                      <dd>
                                                                      <s:url id="url" action="showAllGridOwner_by_page_owner">
																	 		<s:param name="owner_status">1</s:param>
																		</s:url>
																		<s:a href="%{url}" method="post" target="iframe" cssClass="childmenu">全部格主信息</s:a>
                                                                      	</dd>
                                                                      </dl>
                                                         <dl class="submenu">
                                                         <dt>
                                                         <s:url id="url" action="show_by_page_brandowner">
															<s:param name="page">1</s:param>
														    </s:url>
															<s:a href="%{url}" method="post" target="iframe" cssClass="childmenu">公告栏信息</s:a>
                                                         </dt>
                                                         </dl>
                                                         <dl class="submenu"><dt>售货员信息</dt>
                                                                      <dd><a href="${pageContext.request.contextPath}/Brand/brandmanage/shouhuoyuan.jsp" target="iframe" class="childmenu">添加售货员</a></dd>
                                                                      <dd>
                                                                      	<s:url id="url" action="showSalesMen_brandowner">
                                                                      	<s:param name="owner_status">1</s:param>
																		</s:url>
																		<s:a href="%{url}" target="iframe" cssClass="childmenu">全部售货员信息</s:a>
                                                           				</dd>
                                                                      </dl>
                                                         <dl class="submenu"><dt>格子优惠信息</dt>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Prefere_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">7</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}"  target="iframe" cssClass="childmenu">当前上架优惠信息</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Prefere_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">2</s:param>
																		<s:param name="owner_status">1</s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	</s:url>
																	<s:a href="%{url}" target="iframe" cssClass="childmenu">审批上架优惠信息</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Prefere_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">1</s:param>
																		<s:param name="owner_status">1</s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	</s:url>
																	<s:a href="%{url}" target="iframe" cssClass="childmenu">审批下架优惠信息</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Prefere_brandOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">8</s:param>
																		<s:param name="owner_status"></s:param>
																		<s:param name="brandgrid_Gridnum"></s:param>
																	    </s:url>
																		<s:a href="%{url}"  target="iframe" cssClass="childmenu">已下架优惠信息</s:a>
                                                                      </dd>
                                                                      </dl>
                                                         <dl class="submenu"><dt><a a href="${pageContext.request.contextPath}/Brand/brandmanage/xiaoshoujilu-top.jsp" target="iframe" class="childmenu">销售记录</a></dt></dl>
                                                         <dl class="submenu"><dt><a a href="${pageContext.request.contextPath}/Brand/showOther/print.jsp" target="blank" class="childmenu">打印销售记录</a></dt></dl>
                                                         <dl class="submenu"><dt><a a href="${pageContext.request.contextPath}/Brand/brandmanage/yejifengxi.jsp" target="iframe" class="childmenu">业绩分析</a></dt></dl>
                                                         <dl class="submenu"><dt>
                                                         <s:url id="url" action="find_brandowner">
														 </s:url>
														 <s:a href="%{url}" target="iframe" cssClass="childmenu">账户信息</s:a>
                                                         </dt></dl>
                                                         <dl class="submenu"><dt><a href="${pageContext.request.contextPath}/Brand/brandmanage/xiugaidengluxinxi.jsp" target="iframe" class="childmenu">修改登录信息</a></dt>            
                                                         </dl>
                                      </div>
									  <div id="daohang3"></div>
	                </div>
					<div id="weizhi" class="ziti3">当前位置</div>
					<div id="right"><div id="xuxian1"></div>
					                <div id="xuxian2"></div>
									<div id="xuxian3"></div>
                                    <div id="content"><iframe id="iframe" name="iframe" frameborder="0"></iframe></div>
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
<div id="bottom"> Copyright ©2012 网格</div>
</body>
</html>
