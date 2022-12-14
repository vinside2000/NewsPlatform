<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/j	s/jquery-easyui-1.4.1/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="/css/taotao.css" />
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<style type="text/css">
	.content {
		padding: 10px 10px 10px 10px;
	}
</style>
</head>
<body class="easyui-layout">
    <div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
		<c:if test="${roleType == 2 || roleType == 3}">
    		<ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
			<c:if test="${roleType == 2 }">
         	<li>
         		<span>新闻管理</span>
         		<ul>
					<li data-options="attributes:{'url':'/item-add.jsp'}">新增新闻</li>
					<li data-options="attributes:{'url':'/item-list.jsp'}">新闻管理</li>
	         	</ul>
         	</li>
			</c:if>
			<c:if test="${roleType == 3}">
				<li>
					<span>网站内容管理</span>
					<ul>
						<li data-options="attributes:{'url':'/content-category.jsp'}">新闻分类管理</li>
					</ul>
				</li>
			</c:if>
			<c:if test="${roleType == 3}">
				<li>
					<span>人员管理</span>
					<ul>
						<li data-options="attributes:{'url':'/user-list.jsp'}">人员管理</li>
					</ul>
				</li>
			</c:if>
         </ul>
		</c:if>
    </div>
    <div data-options="region:'center',title:''">
    	<div id="tabs" class="easyui-tabs">
		    <div title="首页" style="padding:20px;">
		        	<a href="/forward.jsp">返回主页</a>
		    </div>
		</div>
    </div>
    
<script type="text/javascript">
$(function(){
	$('#menu').tree({
		onClick: function(node){
			if($('#menu').tree("isLeaf",node.target)){
				var tabs = $("#tabs");
				var tab = tabs.tabs("getTab",node.text);
				if(tab){
					tabs.tabs("select",node.text);
				}else{
					tabs.tabs('add',{
					    title:node.text,
					    href: node.attributes.url,
					    closable:true,
					    bodyCls:"content"
					});
				}
			}
		}
	});
});
</script>
</body>
</html>