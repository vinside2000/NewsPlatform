<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>校园新闻发布系统</title>
<link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/main.css">
</head>
<body>
	<nav class="navbar navbar-default">
	<div><img alt="" src="/static/image/headlog.png"></div>
	  <div class="container">
	    <div class="navbar-header">
	    	<div class="col-xs-2">
		      	<a href="/webindex.jsp" class="navbar-brand"></a>
		    </div>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    	<div class="row">
	    	  <c:forEach items="${cateList}"  end="5" var="cate">
			  <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="/index?categoryId=${cate.id}">${cate.category}</a></li>
			  	</ul>
			  </div>
			  </c:forEach>
			  <div class="col-xs-3 col-sm-1 col-md-1 hidden-xs">
			  	<ul class="nav navbar-nav">
			  		<li id="tes" class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 更多
		                    <b class="caret"></b>
		                </a>
		                <ul class="dropdown-menu"  >  <!-- style="overflow:scroll" -->
		                <c:forEach items="${cateList}" begin="6" var="cate">
		                	<li id="tea"><a href="/index?categoryId=${cate.id}">${cate.category}</a></li>
		                    <li class="divider"></li>
		                </c:forEach>
		                </ul>
		            </li>
			  	</ul>
			  </div>
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right "> 
		          <li id="tes">
		          	<a class="curlink" href="/signup.jsp"><span class="glyphicon glyphicon-plus"></span>&nbsp;注册</a>
		          </li> 
		        </ul>
			  </div>
			  
			  <c:if test="${empty user }">
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right "> 
		           <li id="tes"><a href="/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
		        </ul>
			  </div>
			  </c:if>
			  
			  <c:if test="${not empty user }">
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right "> 
		           <li id="tes">
                    <a class="curlink" href="${pageContext.request.contextPath}/logoutServlet"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</a>
                   </li>
		        </ul>
			  </div>
			  </c:if>

			  <c:choose>
				  <c:when test="${ roleType == 1 || roleType == null}">
					  <div class="col-sm-1 hidden-xs ">
						  <ul class="nav navbar-nav navbar-right ">
							  <li id="tes"><a class="curlink" href="/#"><span class="glyphicon glyphicon-user"></span>&nbsp;${user.username}</a></li>
						  </ul>
					  </div>
				  </c:when>
				  <c:otherwise>
					  <div class="col-sm-1 hidden-xs ">
						  <ul class="nav navbar-nav navbar-right ">
							  <li id="tes"><a class="curlink" href="/index.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;${user.username}</a></li>
						  </ul>
					  </div>
				  </c:otherwise>
			  </c:choose>
			</div>
	    </div>
	  </div>
	</nav>
	
	
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<div class="hidden-xs list-groud side-bar">
				
				<c:if test="${parentCategoryId==0 }">
					<a href="/index?parentCategoryId=0" class="list-group-item active">综合</a>
				</c:if>
				
				<c:if test="${parentCategoryId!=0 }">
					<a href="/index?parentCategoryId=0" class="list-group-item">综合</a>
				</c:if>
				
				<c:forEach items="${parentCate}"  var="Pcate">
					<c:if test="${parentCategoryId==Pcate.id}">
					<a href="/index?parentCategoryId=${Pcate.id}" class="list-group-item active">${Pcate.category}</a>
					</c:if>
					<c:if test="${parentCategoryId!=Pcate.id }">
					<a href="/index?parentCategoryId=${Pcate.id}" class="list-group-item ">${Pcate.category}</a>
					</c:if>
				</c:forEach>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="news-list">
				<c:forEach items="${itemList}"   var="item">
				<div class="news-list-item clearfix">
						<div class="col-xs-3">
							<img src="${item.image1 }">
						</div>
						<div class="col-xs-9">
							<a href="/details?itemId=${item.id }" class="title">${item.title}</a>
							<div class="info">
								<span>
									<span class="avatar">
										<img src="/static/image/logo.jpg">
									</span>
									${item.writer }
								</span>·
								<span>24k评论</span>&nbsp;·
								<span>
									7分钟前
								</span>
							</div>
						</div>
					</div>
					
				</c:forEach>
				</div>
			</div>
			<!-- 右侧栏 -->
			<div class="col-sm-3">
			<form action="searchingNews" mesthod="post">
				<div class="search-bar">
						<input type="search" class="form-control" placeholder="搜一下" name="title">	
				</div>
			</form>
				<!-- clearfix清除栅格浮动 -->
				<div class="side-bar-card flag clearfix">
					<div class="col-xs-5">
						<img alt="" src="/static/image/1-1.jpg">
					</div>
					<div class="col-xs-7">
						<div class="text-lg">有害信息举报专区</div>
						<div>举报电话：12377</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 页脚 -->
	<div class="footer">
		校园新闻发布系统 © 2022 - 2022
	</div>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>