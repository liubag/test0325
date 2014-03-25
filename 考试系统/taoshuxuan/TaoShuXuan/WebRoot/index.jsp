<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>网上购书中心首页</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=request.getContextPath()%>/css/basic.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/guanggao.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.2.6.pack.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/top1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/guanggao.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
	<script type="text/javascript">
		var indexHref="http://localhost:8080/TaoShuXuan/index.jsp";
		if(top.location.href!=indexHref){
			top.location.href=indexHref;
		}
	</script>
    </head>
    <body>
    	<div id="header_page">
           <jsp:include page="header.jsp" />
        </div>
        <div id="main">
        	<div id="sidebar">
            	<div class="sidebar1">
					<img src="images/sidebar1.png" alt="导航"/>
					<ul>
						<li><a href="###">三味书屋</a></li>
						<li><a href="###">百草屋</a></li>
						<li><a href="###">佛偈</a></li>
						<li><a href="###">人生白皮书</a></li>
						<li><a href="###">经典爱情故事</a></li>
						<li><a href="###">十万个为什么</a></li>
					</ul>
				</div>
              	<div class="sidebar1">
					<img src="images/sidebar2.png" alt="导航"/>
					<ul>
						<li><a href="###">三味书屋</a></li>
						<li><a href="###">百草屋</a></li>
						<li><a href="###">佛偈</a></li>
						<li><a href="###">人生白皮书</a></li>
						<li><a href="###">经典爱情故事</a></li>
						<li><a href="###">十万个为什么</a></li>
					</ul>
				</div>
              
                <div id="sidebar3">
					<img src="images/sidebar3.png" alt="导航"/>
					<ul>
						<li><a href="###">三味书屋</a></li>
						<li><a href="###">百草屋</a></li>
						<li><a href="###">佛偈</a></li>
						<li><a href="###">人生白皮书</a></li>
						<li><a href="###">经典爱情故事</a></li>
						<li><a href="###">十万个为什么</a></li>
						<li><a href="###">少年维特之烦恼</a></li>
					</ul>
					<ul class="end">

						<li><a href="###">佛偈</a></li>
						<li><a href="###">人生白皮书</a></li>
						<li><a href="###">经典爱情故事</a></li>
						<li><a href="###">十万个为什么</a></li>
						<li><a href="###">少年维特之烦恼</a></li>
					</ul>
				</div>
                <div id="sidebar4"><img src="images/sidebar4.jpg" alt="导航"/></div>
                <div id="sidebar5"><img src="images/sidebar5.jpg" alt="导航"/></div>
                <div id="sidebar6"><img src="images/sidebar6.jpg" alt="导航"/></div>
                <div id="sidebar7"><img src="images/sidebar7.jpg" alt="导航"/></div>
                <div id="sidebar8"><img src="images/sidebar8.jpg" alt="导航"/></div>
            </div>
            <div id="main1">
            	<div id="main11">
                	<div id="main111">
                    	<div id="main1111">
							<div id="banner">	
								<div id="banner_bg"></div>  <!--标题背景-->
								<div id="banner_info"></div> <!--标题-->
								<ul>
									<li class="on">1</li>
									<li>2</li>
									<li>3</li>
									<li>4</li>
								</ul>
							   <div id="banner_list">
									<a href="#" target="_blank"><img src="images/p1.jpg" title="淘宝轩的小阁主" alt="淘宝轩的小阁主" /></a>
									<a href="#" target="_blank"><img src="images/p5.jpg" title="淘宝轩的小阁主" alt="淘宝轩的小阁主" /></a>
									<a href="#" target="_blank"><img src="images/p3.jpg" title="淘宝轩的小阁主" alt="淘宝轩的小阁主" /></a>
									<a href="#" target="_blank"><img src="images/p4.jpg" title="淘宝轩的小阁主" alt="淘宝轩的小阁主" /></a>
								</div>
							</div>
						</div>
                        <div id="hotsale_newbook">
                        		<img src="images/xinshutuijian.jpg"/>
								<div id="more_newbook"><a href="###">更多>></a></div>
								<ul>
								
								</ul>
                   	    </div>
                </div>
                <div id="search_guanggao">
                    <div id="search">
                    	<jsp:include page="searchEngine/shou.jsp" />
                    </div> 
                        <div id="main112">
                            <div id="main1121">
                                <img src="images/cuxiao.jpg" alt="促销"/>
                            </div> 
                            <div id="main1122">
                                <img src="images/cuxiao1.jpg" alt="促销"/>
                            </div>
                        </div>
                 </div>
                <div id="main12">
                	<div id="main121"><span class="hotsale_font"><img src="images/hotsale_font.jpg" /></span><span class="hotsaleheader_img"><img src="images/zuixin.jpg" alt="最新"/></span></div>
                    <div id="main122">
                    	<div class="hotsale_div1">
                        	<div id="hotsale_div2">
                                
                             </div>
                         </div>
                    </div>
                </div>
                <div id="main13">
                	<div id="main131"><span class="hotsale_font"><img src="images/hotauthor_font.jpg"/></span><span class="hotauthorheader_img"><img src="images/reqin.jpg" alt="最新"/></span></div>
                    <div id="main132">
                    	
                    </div>
                </div>
                <div id="main14">
                	<div id="main141"><span class="hotsale_font"><img src="images/hotcollection_font.jpg"/></span><span class="hotcollection_img"><img src="images/tuijian.jpg" alt="最新"/></span></div>
                    <div id="main142">
                    	<div class="main1421">
								<div id="hotcollection">
										
										
								</div>
						</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
         <div id="footer_page">
        	<jsp:include page="footer.jsp" />
        </div>
    </body>
</html>