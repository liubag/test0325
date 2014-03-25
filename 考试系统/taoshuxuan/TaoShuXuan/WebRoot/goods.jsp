<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="<%=request.getContextPath()%>/css/style.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/css/guanggao.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/css/goods.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.5.2.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/goods.js" charset="utf-8"></script>
	</head>

	<body>
		<div id="header_page">
			<jsp:include page="header.jsp" />
		</div>
		<div id="main">
			<s:action name="findComment">
				<s:param name="book_id">${book.book_id}</s:param>
			</s:action>
			<input type="hidden" class="all"
				value="<s:property value="#request.starList.get(0)"/>" />
			<input type="hidden" class="oneStar"
				value="<s:property value="#request.starList.get(1)"/>" />
			<input type="hidden" class="twoStar"
				value="<s:property value="#request.starList.get(2)"/>" />
			<input type="hidden" class="threeStar"
				value="<s:property value="#request.starList.get(3)"/>" />
			<input type="hidden" class="fourStar"
				value="<s:property value="#request.starList.get(4)"/>" />
			<input type="hidden" class="fiveStar"
				value="<s:property value="#request.starList.get(5)"/>" />

			<div id="sidebar">
				<div class="sidebar1">
					<img src="<%=request.getContextPath()%>/images/sidebar1.png"
						alt="导航" />
					<ul>
						<li>
							<a href="###">三味书屋</a>
						</li>
						<li>
							<a href="###">百草屋</a>
						</li>
						<li>
							<a href="###">佛偈</a>
						</li>
						<li>
							<a href="###">人生白皮书</a>
						</li>
						<li>
							<a href="###">经典爱情故事</a>
						</li>
						<li>
							<a href="###">十万个为什么</a>
						</li>
					</ul>
				</div>
				<div class="sidebar1">
					<img src="<%=request.getContextPath()%>/images/sidebar2.png"
						alt="导航" />
					<ul>
						<li>
							<a href="###">三味书屋</a>
						</li>
						<li>
							<a href="###">百草屋</a>
						</li>
						<li>
							<a href="###">佛偈</a>
						</li>
						<li>
							<a href="###">人生白皮书</a>
						</li>
						<li>
							<a href="###">经典爱情故事</a>
						</li>
						<li>
							<a href="###">十万个为什么</a>
						</li>
					</ul>
				</div>

				<div id="sidebar3">
					<img src="<%=request.getContextPath()%>/images/sidebar3.png"
						alt="导航" />
					<ul>
						<li>
							<a href="###">三味书屋</a>
						</li>
						<li>
							<a href="###">百草屋</a>
						</li>
						<li>
							<a href="###">佛偈</a>
						</li>
						<li>
							<a href="###">人生白皮书</a>
						</li>
						<li>
							<a href="###">经典爱情故事</a>
						</li>
						<li>
							<a href="###">十万个为什么</a>
						</li>
						<li>
							<a href="###">少年维特之烦恼</a>
						</li>
					</ul>
					<ul class="end">

						<li>
							<a href="###">佛偈</a>
						</li>
						<li>
							<a href="###">人生白皮书</a>
						</li>
						<li>
							<a href="###">经典爱情故事</a>
						</li>
						<li>
							<a href="###">十万个为什么</a>
						</li>
						<li>
							<a href="###">少年维特之烦恼</a>
						</li>
					</ul>
				</div>
				<div id="sidebar4">
					<img src="<%=request.getContextPath()%>/images/sidebar4.jpg"
						alt="导航" />
				</div>
				<div id="sidebar5">
					<img src="<%=request.getContextPath()%>/images/sidebar5.jpg"
						alt="导航" />
				</div>
				<div id="sidebar6">
					<img src="<%=request.getContextPath()%>/images/sidebar6.jpg"
						alt="导航" />
				</div>
				<div id="sidebar7">
					<img src="<%=request.getContextPath()%>/images/sidebar7.jpg"
						alt="导航" />
				</div>
				<div id="sidebar8">
					<img src="<%=request.getContextPath()%>/images/sidebar8.jpg"
						alt="导航" />
				</div>
			</div>
			<div class="right">
				<div id="mydnew_break">
					 你现在的位置：<a href="gainGoods_by_keyWord.do?otherOrderBy=&keyWord=${book.catagory.catagory_parent.catagory_name}&rowName=3"" target="_blank">${book.catagory.catagory_parent.catagory_name }</a> >${book.catagory.catagory_name }
				</div>
				<div class="book_title">
					<input type="hidden" id="book_title" value="${book.name }"/>
					<h1>
						${book.name }
					</h1>
				</div>
				<div class="showBook">
					<div class="pc">
						<img id="largePic"
							src="<%=path%>/../BookImages/cover/${book.book_image}" />
					</div>
				</div>
				<div class="infoBook">
					<p class="price_d">
						当 当 价：
						<span class="num">￥<fmt:formatNumber value="${book.price*book.discount}" pattern=".00"/></span>
					</p>
					<p class="price_m">
						定&#12288;&#12288;价：￥${book.price}
						<span>折扣:<span class="red"><fmt:formatNumber value="${book.discount*100}" pattern="0"/>折</span>
						</span>
					</p>
					<p class="fraction">
						顾客评分：
						<span><img src="images/star_red.gif"/>
							<img src="images/star_red.gif"/>
							<img src="images/star_red.gif"/>
							<img src="images/star_red.gif"/>
							<img src="images/star_red2.gif"/>
						</span><a id="comm_num_up" name="__Commentnum_pub" href="#review_point">已有人<s:property
								value="#request.starList.get(0)" />评论</a>
					</p>
					<div name="__Property_pub" class="book_detailed">
						<p>
							作&#12288;&#12288;者：
							<a href="#">${book.author}</a> 著
						</p>
						<p>
							出 版 社：
							<a href="#">${book.publish_company}</a>
						</p>
						<p>
							出版时间：
							<fmt:formatDate value="${book.publish_date}" type="date" />
						</p>
						<ul class="clearfix">
							<li>
								<span>库存：${book.storage_num}</span><span>I S B
									N：${book.isbn}</span>
							</li>
						</ul>
					</div>
					<div class="property">
						<div class="clearfix">
							<label>
								我要买：
							</label>
							<input type="text" class="text" id="buy_num" name="buy_num" value="1"/>
							件
							<span style="display: none" class="warning" id="buy_num_text">请输入购买数量</span>
						</div>
						<div class="but clearfix">

							<a id="buy" href="#" name="${book.book_id}">
								<img src="<%=request.getContextPath()%>/images/but_buy.gif" />
							</a>
							<a id="collect" href="#" name="${book.book_id}" >
							<img src="<%=request.getContextPath()%>/images/but_collect.gif" />
							</a>
						</div>
					</div>

				</div>
				<div class="introduceBook">
					<p class="introduceBook_title">
						商品详情
					</p>
					<span class="content">
						<h4>
							内容简介
						</h4>
						<div class="content_text">
							<p>
								${book.content_summary}
							</p>
						</div> </span>
					<div id="comm_all" class="comment book_comment">
						<div class="score_wrap clearfix">
							<div style="height: 147px" class="NewCommentOne NewCommentTwo">
								<h3>
									<em>所有打分及评论均来自已购买本产品的用户</em><span
										style="width: 14px; height: 14px; background-position: -2853px 0; margin: 5px 0 0 7px; padding: 0; display: inline;"
										class="sprites"></span><span>商品评价（共<strong><s:property
												value="#request.starList.get(0)" />
									</strong>名用户）</span>
									<div class="titlepj">
										<label>
											综合评分
										</label>
										<div style="margin-top: 5px; display: inline; float: left;">
											<sub style="background-position: -2084px 0px"
												class="SpriteStar"></sub><sub
												style="background-position: -2084px 0px" class="SpriteStar"></sub><sub
												style="background-position: -2084px 0px" class="SpriteStar"></sub><sub
												style="background-position: -2084px 0px" class="SpriteStar"></sub><sub
												style="background-position: -2084px 0px" class="SpriteStar"></sub>
										</div>
									</div>

								</h3>
								<div class="plGoodBad">

									<ul>
										<li class="goodPing">
											<p>
												好评率
											</p>
											<p class="goodPLv">
											</p>
										</li>
										<li class="haozhonghuai">
											<dl>
												<dd>

													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif" />

													<span><strong class="fiveStarRate star">&nbsp;</strong>
													</span><span class="fiveRate"></span>
												</dd>
												<dd>

													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>

													<span class="boxZP"><strong
														class="fourStarRate star">&nbsp;</strong>
													</span><span class="fourRate"></span>
												</dd>
												<dd>

													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<span class="boxCP"><strong
														class="threeStarRate star">&nbsp;</strong>
													</span><span class="threeRate"></span>
												</dd>
												<dd>

													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<span class="boxCP"><strong class="twoStarRate star">&nbsp;</strong>
													</span><span class="twoRate"></span>
												</dd>
												<dd>
													<img src="<%=request.getContextPath()%>/images/star_red.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<img src="<%=request.getContextPath()%>/images/star_gray.gif"/>
													<span class="boxCP"><strong class="oneStarRate star">&nbsp;</strong>
													</span><span class="oneRate"></span>
											</dl>
										</li>
										<li class="meGouMai">
											<p>
												我已购买过此商品
											</p>
											<a class="goumaiButton track" target="_blank"
												name="item-mycomment"
												href="//my.vancl.com/comment/Appraisetransfer/30556"></a><span
												class="blank10"></span><a style="color: #A10000"
												target="_blank" href="#" class="track" name="item-allreview">[查看全部评论]</a>
										</li>
									</ul>
								</div>

							</div>
						</div>
						<s:iterator value="#request.comment_l" status="st">
							<h5>
								<a name="reviewDetail" target="_blank" href="#"><s:property
										value="title" />
								</a>
							</h5>
							<div class="text">
								<div id="displayimgshow23524870">
									<div class="pl_photo">
										<img class="show_user_info name"
											src="<%=request.getContextPath()%>/images/7697361930895-1_d.png" />
									</div>
								</div>
								<div class="title">
									<span id="vote_user23524870"><span class="level">评论会员：</span><a
										id="show_user_info|20376106" target="_blank"
										class="show_user_info name" href="#"><s:property
												value="customer.name" />
									</a>
									</span><span id="review_commend23524870">评论星级：<s:property value="score" />星</span>
								</div>
								<div class="title2">
									<span class="time"><s:property
											value="comment_date.toLocaleString()" />
									</span>
								</div>
								<p class="comment_text">
									<s:property value="content" />
								</p>
							</div>
						</s:iterator>
						<div class="qa_all">
							<a name="__QandA_all_pub" class="qa_view" target="_blank"
								href="#">查看所有<s:property value="#request.starList.get(0)" />条问答</a>
						</div>
					</div>
				</div>
			</div>

			<div id="footer_page">
				<jsp:include page="footer.jsp" />
			</div>
	</body>
</html>
