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
        $('#shijian').jclock({ withDate: true });
        
    })
     var url = top.location.href;
    	var url2 = "http://${header['host']}${pageContext.request.contextPath}/Brand/gridmanage/gridmanage.jsp";
    	if(url != url2){
    		top.location.href = "${pageContext.request.contextPath}/Brand/gridmanage/gridmanage.jsp";
    	}
</script>
<script type="text/javascript">
	function fabu(){
        $.ajax({
			type: "POST",
			url: "/WangGe/isCanAddPer_gridowner.do",
			dataType: 'text',
			contentType:"text/html;charset=utf-8",
			error:function(data){
				return false;
			},
			success: function(data){
				if(data=="success"){
					$("#giframe",document.body).attr("src","${pageContext.request.contextPath}/show_SHGoods_gridowner.do");	
				}else{
					alert("只能同时存在一条正在申请上架或已上架的优惠信息。");
				}	
			},
			complete:function(data){
				
			}
		});	
		return false;
    }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>品牌店格主管理后台</title>
<link href="${pageContext.request.contextPath}/Brand/css/gridmanage-css.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Brand/css/gridmanage-div.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="box">
    <div id="top"><div id="top1" class="top"></div>
                  <div id="top2" class="top"><div id="tuichu" class="ziti1" align="right">
                  <s:url id="url" action="exit_gridowner">
					</s:url>
			<s:a href="%{url}" method="post">[退出]</s:a>
                  </div>
				                             <div id="huanying" class="ziti1" align="right"><span>[<s:property value="#session.truename"/>]</span><span>欢迎您！</span><span>登陆时间为:</span><div id="shijian"></div>
											 </div>
			      </div>
    </div>
	<div id="zhuti">
	<div id="zuoshang1"></div>
	<div id="zhong1"></div>
	<div id="youshang1"></div>
	<div id="zhong2"></div>
	<div id="zhong"><div id="daohang"><div id="daohang1"></div>
	                                  <div id="daohang2"><dl class="submenu"><dt>商品管理</dt>
                                                                      <dd><a href="${pageContext.request.contextPath}/Brand/gridmanage/goodsUpload.jsp" target="giframe" class="childmenu">上传同时申请上架</a></dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_gridOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">0</s:param>
																		<s:param name="statu">0</s:param>
																	    </s:url>
																		<s:a href="%{url}" target="giframe" cssClass="childmenu">上传申请上架商品</s:a>
                                                                      </dd> 
                                                                      <dd>
                                                                       <s:url id="url" action="show_All_Goods_gridOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">5</s:param>
																		<s:param name="statu">5</s:param>
																	    </s:url>
																		<s:a href="%{url}" target="giframe" cssClass="childmenu">已上架商品</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_gridOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">6</s:param>
																		<s:param name="statu">6</s:param>
																	    </s:url>
																		<s:a href="%{url}" target="giframe" cssClass="childmenu">已下架商品</s:a>
                                                                      </dd>
                                                                      <dd>
                                                                      <s:url id="url" action="show_All_Goods_gridOwner">
																		<s:param name="page">1</s:param>
																		<s:param name="statu_choice">7</s:param>
																		<s:param name="statu">7</s:param>
																	    </s:url>
																		<s:a href="%{url}" target="giframe" cssClass="childmenu">旧库存</s:a>
                                                                     	</dd>
                                                                      </dl>
                                                         <dl class="submenu"><dt>格子优惠信息</dt>
			                                                         <dd>
																		<a href="" target="giframe" class="childmenu" onclick="return fabu();">发布同时申请上架</a>
                                                                      </dd>
                                                                      <dd><a href="${pageContext.request.contextPath}/Brand/gridmanage/qitayouhuizhuangtai.jsp" target="giframe" class="childmenu">其他状态优惠状态</a></dd>
                                                                      <dd>
                                                                      <s:url id="url" action="showAllPre_page_gridowner">
																		<s:param name="page"><s:property value="hasPages"/></s:param>
																		<s:param name="owner_status">5</s:param>
																		</s:url>
																		<s:a href="%{url}" target="giframe" cssClass="childmenu">以往下架优惠信息</s:a>
                                                                      </dd>
                                                                      </dl>
                                                         <dl class="submenu"><dt><a href="${pageContext.request.contextPath}/Brand/gridmanage/xiaoshoujilu-top1.jsp" target="giframe" class="childmenu">销售记录</a></dt></dl>
                                                         <dl class="submenu"><dt>
                                                         	<s:url id="url" action="findgridowner_gridowner">
                                                         	<s:param name="owner_status">gzxi</s:param>
														  	</s:url>
															<s:a href="%{url}" target="giframe" cssClass="childmenu">格子信息</s:a>
                                                         	</dt></dl>
                                                         <dl class="submenu"><dt>
                                                          <s:url id="url" action="findgridowner_gridowner">
														  </s:url>
															<s:a href="%{url}" target="giframe" cssClass="childmenu">账户信息</s:a>
                                                         </dt>
                                                         </dl>
                                                         <dl class="submenu"><dt><a href="${pageContext.request.contextPath}/Brand/gridmanage/xiugaidengluxinxi.jsp" target="giframe" class="childmenu">修改登录信息</a></dt>            
                                                         </dl>
                                      </div>
									  <div id="daohang3"></div>
	                </div>
					<div id="weizhi" class="ziti3">当前位置</div>
					<div id="right"><div id="xuxian1"></div>
					                <div id="xuxian2"></div>
									<div id="xuxian3"></div>
                                    <div id="content"><iframe id="giframe" name="giframe" frameborder="0"></iframe></div>
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
