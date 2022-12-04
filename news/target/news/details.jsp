<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新闻详情页</title>
<link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/main.css">
<link rel="stylesheet" href="../static/base/css/bootstrap-movie.css">
<link rel="stylesheet" href="../static/base/css/animate.css">
<link rel="stylesheet" type="text/css" href="../static/jwplayer/skins/stormtrooper.css">
<script type="text/javascript" src="../static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../static/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="../static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="../static/base/js/jquery.singlePageNav.min.js"></script>
<script src="../static/base/js/wow.min.js"></script>
<script src="../static/lazyload/jquery.lazyload.min.js"></script>
<script src="//cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
<script src="../static/jwplayer/jwplayer.js"></script>

<script type="text/javascript" src="/js/jquery/jquery-2.1.3.js"></script>
<script type="text/javascript" src="/js/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
<script type="text/javascript">
$(function(){

	$("#addCommForm").ajaxForm({success:function(data){
		if(data.success){
			$.messager.alert(data.msg);
			location.reload();
		/* 	$.messager.alert(data.msg,function(data){
				if(data){
					window.location.href="/details";
				}else{
					window.location.href="/details";
				}
			});	 */
		}else{
			$.messager.alert(data.msg);
			//$.messager.popup(data.msg);
		}
	}});
	/*  $("#btn-coldetail").click(function(){
		$("#addCommForm").ajaxForm({success:function(data){
			if(data.success){
				$.messager.alert(data.msg);
				location.reload();
			}else{
				$.messager.alert(data.msg);
			}
		}});
		});  */
		
});  
function login() {
    $.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/addcol" ,//url
        data: $('#addCommForm').serialize(),
        success: function (data) {
        	$.messager.alert(data.msg);
			location.reload();
        },
        error : function() {
        	$.messager.alert(data.msg);
        }
    });
}
</script>
<script>
var ue = UE.getEditor('input_content',{
    toolbars: [
        ['fullscreen', 'emotion', 'preview', 'link']
    ],
    initialFrameWidth:"100%",
    initialFrameHeight:"100",
});
</script>
</head>
<body>
	<nav class="navbar navbar-default">
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
		                    <!-- <li id="tea"><a href="#">娱乐</a></li>
		                    <li class="divider"></li>
		                    <li id="tea"><a href="#">房价</a></li> -->
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
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right "> 
		           <li id="tes"><a class="curlink" href="user"><span class="glyphicon glyphicon-user"></span>&nbsp;管理中心</a></li>
		        </ul>
			  </div>
			</div>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
		<div class="col-md-8">
			<!-- <h1 class="news-title">24小时内2名中国学生在英国失联%20使馆、警方已介入</h1>

			<div class="news-status">25K阅读·35分钟前发布
				<div class="label label-default">教育</div>
				<div class="label label-default">情感</div>
			</div> -->
			<h1 class="news-title">${detail.title }</h1>
			
			<div class="news-status">25K阅读·35分钟前发布
				<div class="label label-default">${detail.typeName}</div>
			</div>
			<div class="news-content">
				${detail.content }
			</div>
		</div>
		<div class="col-md-12" style="margin-top:6px;">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;评论</h3>
                </div>
                <div class="panel-body">
                <c:if test="${empty user }">
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>请先<a href="/login.jsp" target="_blank" class="text-info">登录</a>，才可参与评论！</strong>
                    </div>
                </c:if>
                    <ol class="breadcrumb" style="margin-top:6px;">
                        <li>全部评论(${fn:length(commList)})</li>
                    </ol>
                    <ul class="commentList">
                        <!-- 循环遍历 -->
                        <c:forEach items="${commList}"   var="comm">
                            <li class="item cl">
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta">
                                            <c:if test="${comm.username!=null}">
                                                <a class="comment-author" href="user.html">${comm.username }</a>
                                            </c:if>
                                            <c:if test="${comm.username==null}">
                                                <a class="comment-author" href="user.html">该用户尚未填写用户名</a>
                                            </c:if>
                                            评论于 2022-12-4 8:00
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p>${comm.comment}</p>
                                    </div>
                                    <c:if test="${roleType == 3}">
                                        <a href="${pageContext.request.contextPath}/deleteCommServlet?id=${comm.id}&newsId=${detail.newsId}" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>
                                    </c:if>
                                </div>

                            </li>
                        </c:forEach>
                        <!-- #循环遍历 -->
                    </ul>
                <c:if test="${not empty user }">
                    <form id="addComment" method="post" action="${pageContext.request.contextPath}/addCommentServlet" role="form" style="margin-bottom:6px;">
                    <input type="hidden" id="userId" name="userId" value="${user.userId }"/>
                    <input type="hidden" id="detailId" name="newsId" value="${detail.newsId }"/>
                        <div class="form-group">
                            <div>
                                <label for="input_content">内容</label>
                                <textarea id="input_content" name="comment"></textarea>
                            </div>
                            <div class="col-xs-12" id="error_content"></div>
                        </div>
                        <input type="submit" class="btn btn-success" id="btn-sub" value="提交评论">
                    </form>
                </c:if>  

                    <div class="col-md-12 text-center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="/details?itemId=${detail.newsId}&pn=1" aria-label="First">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                                
                                <c:if test="${pageInfo.hasPreviousPage}">
                                <li >
                                    <a href="/details?itemId=${detail.newsId}&pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                                </c:if> 
                                <c:if test="${!pageInfo.hasPreviousPage}">
                                <li >
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                                </c:if> 
                                
                                
                                <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->  
			                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">  
			                        <c:if test="${page_num == pageInfo.pageNum}">  
			                            <li class="active"><a href="#">${page_num}</a></li>  
			                        </c:if>  
			                        <c:if test="${page_num != pageInfo.pageNum}">  
			                            <li><a href="/details?itemId=${detail.newsId}&pn=${page_num}">${page_num}</a></li>
			                        </c:if>  
			                    </c:forEach>
			                    <c:if test="${pageInfo.hasNextPage}">
                                <li>
                                    <a href="/details?itemId=${detail.newsId}&pn=${pageInfo.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">下一页</span>
                                    </a>
                                </li>
			                    </c:if> 
			                    <c:if test="${!pageInfo.hasNextPage}">
			                                <li>
			                                    <a href="#" aria-label="Next">
			                                        <span aria-hidden="true">下一页</span>
			                                    </a>
			                                </li>
			                    </c:if>  
                                <li>
                                    <a href="/details?itemId=${detail.newsId}&pn=${pageInfo.pages}" aria-label="Last">
                                        <span aria-hidden="true">尾页</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </div>
            </div>
        </div>
	</div>

	<!-- 页脚 -->
	<div class="footer">
		校园新闻发布系统 © 2022 - 2022
	</div>

    <script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<%--    <script>--%>
<%--        function destroyComm(id) {--%>
<%--            console.log(id);--%>
<%--            if (id) {--%>
<%--                $.messager.confirm('Confirm', '确定要删除该条评论?', function(r) {--%>
<%--                    if (r) {--%>
<%--                        $.post('${pageContext.request.contextPath}/deleteCommServlet', {--%>
<%--                            id : id--%>
<%--                        });--%>
<%--                    }--%>
<%--                });--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>
</body>
</html>

