<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录页面</title>
<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/main.css">
<script type="text/javascript" src="/js/jquery/jquery-2.1.3.js"></script>
<script type="text/javascript" src="/js/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
</head>

<body>
	<nav class="navbar navbar-default">
	  <div class="container">
	    <div class="navbar-header">
	    	<div class="col-xs-2">
		      	<a href="/webindex.jsp" class="navbar-brand"></a>
		    </div>
	    	<div class="col-xs-8 visible-xs">
	    		<div class="col-xs-7">
			    </div>
	    		<div class="col-xs-5">
				  	<ul class="nav navbar-nav navbar-right"> 
			          <li id="tes"><a href="/signup.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
			        </ul>
			    </div>
			</div>
			<div class="col-xs-2">
			  	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
	      				data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">更多</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			</div>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    	<div class="row">
			  <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="#">热闻</a></li>
			  	</ul>
			  </div>
			  
			  <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="#">国际</a></li>
			  	</ul>
			  </div>
			  <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="#">数读</a></li>
			  	</ul>
			  </div>
			  <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="#">社会</a></li>
			  	</ul>
			  </div>
			  <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="#">军事</a></li>
			  	</ul>
			  </div>
			  <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="#">政务</a></li>
			  	</ul>
			  </div>
			   <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="#">公益</a></li>
			  	</ul>
			  </div>
			   <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="#">体育</a></li>
			  	</ul>
			  </div>
			  <div class="col-xs-3 col-sm-1 col-md-1 hidden-xs">
			  	<ul class="nav navbar-nav">
			  		<li id="tes" class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 更多
		                    <b class="caret"></b>
		                </a>
		                <ul class="dropdown-menu">
		                    <li id="tea"><a href="#">娱乐</a></li>
		                    <li class="divider"></li>
		                    <li id="tea"><a href="#">房价</a></li>
		                </ul>
		            </li>
			  	</ul>
			  </div>
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right"> 
		          <li id="tes">
		          	<a href="/signup"><span class="glyphicon glyphicon-user"></span> 注册</a>
		          </li> 
		        </ul>
			  </div>
			</div>
	    </div>
	  </div>
	</nav>
	
	<div class="container container-small">
		<h1>登录
			<small>没有账号？<a href="/signup.jsp">注册</a></small>
		</h1>
		<form  id="loginForm" action="${pageContext.request.contextPath}/loginServlet" method="post" >
			<div class="form-group">
				<label>用户名</label>
				<input type="text" name="username"  class="form-control">
			</div>
			<div class="form-group">
				<label>密码</label>
				<input type="password" name="password" class="form-control">
			</div>
			<div class="form-group">
				<a href="#">忘记密码？</a>
			</div>
			<div class="form-group">
				<button class="btn btn-lg btn-primary btn-block" >登录</button>
			</div>
			<br /><br />
			<span style="color: red">${login_msg}</span>
			<br /><br />
		</form>
	</div>
	<!-- 页脚 -->
	<div class="footer">
		校园新闻发布系统 © 2022 - 2022
	</div>
    <script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>