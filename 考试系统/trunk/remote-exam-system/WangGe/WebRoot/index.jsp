<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
    <head>
    <title>网格-首页</title>  
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/WangGe.1.0.js"></script>
	<script type="text/javascript">
		var indexHref="http://localhost:8080/WangGe/index.jsp";
		if(top.location.href!=indexHref){
			top.location.href=indexHref;
		}
	</script>
    </head>
    <body>
    	<div id="header">
        	<div id="nav1">
            	<jsp:include page="top.jsp"></jsp:include>
            </div>
            <div id="logo">
            	<div id="logo11"><img src="images/logo1.jpg" alt="logo1"/></div>
                <div id="logo12"><img src="images/logo2.png" alt="logo1"/></div>	
            </div>
         	<div id="nav2">
            
            	<img class="img1" src="images/search.jpg" alt="导航条"/>
  				<img class="img2" src="images/search1.png" alt="导航条"/>
                <img class="img3" src="images/logo3.png" alt="logo"/>
               <dl>
                    <dd class="search1"><a href="#">主页</a></dd>
                    <dd class="search2"><a href="#">品牌网格</a></dd>
                    <dd class="search3"><a href="#">学生网格</a></dd>
                    <dd class="search4"><a href="#">优惠信息</a></dd>
                    <dd class="search5"><a href="#">关于我们</a></dd>
               </dl>
            </div>
        </div>
    	<div id="main">
        	<div id="search">
            	<p><jsp:include page="searchEngine/shou.jsp" /></p>
                
            </div>
           
              <div id="main1">
                  <div id="nav3">
                  	<jsp:include page="daohang/daohang.jsp" />
                  </div>
                  <div id="bill">
					<jsp:include page="guanggao.jsp" />
				  </div>
               </div>
          <div id="content"> 
                <div id="main2">
                    <div id="brandwangge" class="wangge">
                    	<div id="nav4">
                        	<img src="images/nav4.png" alt="品牌网格"/>
                        </div>
                        <div id="brandsale">
                        	
                        </div>
                    </div>
                    <div id="brandaffiche" class="affiche">
                    	<div class="wrapper1">
							<h1>优惠信息</h1>
							<div id="focus1">
								<ul>
									
								</ul>
							</div>
						</div><!-- wrapper end -->
                    </div>
                </div>
                <div id="main3">
                    <div id="studentwangge" class="wangge">
                    	<div id="nav5">
                        	<img src="images/nav5.png" alt="学生网格"/>
                        </div>
                        <div id="studentsale">
                        	
                        </div>
                    </div>
                    <div id="studentaffiche" class="affiche">
                    	<div class="wrapper1">
							<h1>优惠信息</h1>
							<div id="focus2">
								<ul>
									
								</ul>
							</div>
</div>
                    </div>
                </div>
             </div>
        </div>
        <div id="footer">
        </div>
    </body>
</html>