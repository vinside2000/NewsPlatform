<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table id="dg" style="width:800px" title="新闻列表" rownumbers="true"
       data-options="fit:true" toolbar="#toolbar" fitColumns="true"
       singleSelect="true"></table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editNews()">编辑</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="destroyNews()">删除</a>
    <input id="searchByName" style="line-height:26px;border:1px solid #ccc">
    <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch()">搜索</a>
</div>
<div id="dlg" class="easyui-dialog"
     style="width:1000px;height:600px;padding:10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="fm" method="post">
        <input type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>新闻分类:</td>
                <td>
                    <select name="typeId">
                        <c:forEach items="${typeList}"  var="type">
                            <option value="${type.typeId}">${type.typeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>作者:</td>
                <td><input class="easyui-textbox" type="text" name="author" data-options="required:true" style="width: 280px;"></input></td>
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
                    <textarea style="width:800px;height:300px;" name="content"></textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveNews()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
<script>
    // var itemEditor ;
    // //页面初始化完毕后执行此方法
    // $(function(){
    //     //创建富文本编辑器
    //     itemEditor = TAOTAO.createEditor("#fm [name=content]");
    //     //初始化类目选择和图片上传器
    //     TAOTAO.init({fun:function(node){
    //         }});
    // });
    function editNews() {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $('#dlg').dialog('open').dialog('setTitle', '编辑新闻');
            $('#fm').form('load', row);
            //参数在这里传进去，后面的 save 就不传了
            url = '${pageContext.request.contextPath}/modifyNewsServlet?newsId=' + row.newsId;
        }
    }
    function saveNews() {
        $('#fm').form('submit', {
            url : url,
            onSubmit : function() {
                return $(this).form('validate');
            },
            success : function() {
                alert("修改成功");
                $('#dlg').dialog('close');
                $('#dg').datagrid('reload');
            }
        });
    }
    function destroyNews() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', '确定要删除该条新闻?', function(r) {
                if (r) {
                    $.post('${pageContext.request.contextPath}/deleteNewsServlet', {
                        newsId : row.newsId
                    }, function(result) {
                        $('#dg').datagrid('reload');
                    });
                }
            });
        }
    }
    $('#dg').datagrid({
        columns : [ [ //添加列
            {
                field : 'newsId', //绑定数据源ID
                title : '新闻ID', //显示列名称
                align : 'center', //内容在列居中
                width : 100 ,//列的宽度
                hidden : true
            },
            {
                field : 'title',
                title : '新闻标题',
                align : 'center',
                width : 100
            },
            {
                field : 'author',
                title : '作者',
                align : 'center',
                width : 100
            },
            {
                field : 'typeId',
                title : '分类ID',
                align : 'center',
                width : 100 ,
                hidden : true
            },
            {
                field : 'typeName',
                title : '分类',
                align : 'center',
                width : 100
            },
            {
                field : 'content',
                title : '新闻内容',
                align : 'center',
                width : 100
            },
        ] ],
        pagination : true, //开启分页
        url : '${pageContext.request.contextPath}/newsListServlet', //获取数据地址
        loadFilter : pagerFilter, //调用分页函数
    });
    function pagerFilter(data) {
        if (typeof data.length == 'number' && typeof data.splice == 'function') { // is array
            data = {
                total : data.length,
                rows : data
            }
        }
        var dg = $(this);
        var opts = dg.datagrid('options');
        var pager = dg.datagrid('getPager');
        pager.pagination({
            onSelectPage : function(pageNum, pageSize) {
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh', {
                    pageNumber : pageNum,
                    pageSize : pageSize
                });
                dg.datagrid('loadData', data);
            }
        });
        if (!data.originalRows) {
            data.originalRows = (data.rows);
        }
        var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.originalRows.slice(start, end));
        return data;
    }
    function doSearch() {
        var $uname = $('#searchByName')
        var ByName = $uname.val()


        $('#dg').datagrid({
            //这个的作用类似 Ajax 了！向后台传递数据
            queryParams: {
                ByName: ByName
            },
            columns : [ [ //添加列
                {
                    field : 'newsId', //绑定数据源ID
                    title : '新闻ID', //显示列名称
                    align : 'center', //内容在列居中
                    width : 100 ,//列的宽度
                    hidden : true
                },
                {
                    field : 'title',
                    title : '新闻标题',
                    align : 'center',
                    width : 100
                },
                {
                    field : 'author',
                    title : '作者',
                    align : 'center',
                    width : 100
                },
                {
                    field : 'typeId',
                    title : '分类ID',
                    align : 'center',
                    width : 100 ,
                    hidden : true
                },
                {
                    field : 'typeName',
                    title : '分类',
                    align : 'center',
                    width : 100
                },
                {
                    field : 'content',
                    title : '新闻内容',
                    align : 'center',
                    width : 100
                },
            ] ],
            ByName : ByName,
            url : '${pageContext.request.contextPath}/searchNewsServlet' //获取数据地址
        });
    }
</script>