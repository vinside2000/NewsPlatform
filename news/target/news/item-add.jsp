<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemAddForm" class="itemForm" method="post">
	    <table cellpadding="5">
	       <tr>
	            <td>新闻分类:</td>
	            <td>
					<select name="typeId">
						<option value="1">校园热点</option>
						<option value="2">表白墙</option>
						<option value="3">失物招领</option>
						<option value="4">时政热点</option>
					</select>
	            </td>
	        </tr>
	        <tr>
	            <td>作者:</td>
	            <td><input class="easyui-textbox" type="text" name="author" data-options="required:true" style="width: 280px;" value="${user.username}"></input></td>
	        </tr>
	        <tr>
	            <td>新闻标题:</td>
	            <td><input class="easyui-textbox" name="title" data-options="multiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
	        </tr>
<%--	        <tr>--%>
<%--	            <td>新闻图片:</td>--%>
<%--	            <td>--%>
<%--	            	 <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>--%>
<%--	                 <input type="hidden" name="image1"/>--%>
<%--	            </td>--%>
<%--	        </tr>--%>
	        <tr>
	            <td>新闻内容:</td>
	            <td>
	                <textarea style="width:800px;height:300px;visibility:hidden;" name="content"></textarea>
	            </td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	var itemAddEditor ;
	//页面初始化完毕后执行此方法
	$(function(){
		//创建富文本编辑器
		itemAddEditor = TAOTAO.createEditor("#itemAddForm [name=content]");
		//初始化类目选择和图片上传器
		TAOTAO.init({fun:function(node){
		}});
	});
	//提交表单
	function submitForm(){
		//有效性验证
		if(!$('#itemAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		//同步文本框中的内容
		itemAddEditor.sync();
		$.post("${pageContext.request.contextPath}/addNewsServlet",$("#itemAddForm").serialize(), function(data){
			$.messager.alert('提示','新增新闻成功!');
		});
	}
	
	function clearForm(){
		$('#itemAddForm').form('reset');
		itemAddEditor.html('');
	}
</script>
