<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table id="dg" style="width:800px" title="人员列表" rownumbers="true"
       data-options="fit:true" toolbar="#toolbar" fitColumns="true"
       singleSelect="true"></table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="destroyUser()">删除</a>
</div>
<div id="dlg" class="easyui-dialog"
     style="width:400px;height:280px;padding:10px 20px" closed="true"
     buttons="#dlg-buttons">
    <div class="ftitle">人员信息</div>
    <form id="fm" method="post">
        <div class="fitem">
            <label>username:</label>
            <input name="username" class="easyui-validatebox" disabled>
        </div>
        <br>
        <div class="fitem">
            <label>number:</label>
            <input name="number" class="easyui-validatebox" disabled>
        </div>
        <br>
        <div class="fitem">
            <label>用户角色:</label>
            <select name="roleType">
                <option value="1">普通用户</option>
                <option value="2">新闻记者</option>
                <option value="3">管理员</option>
            </select>
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
<script>
    function editUser() {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $('#dlg').dialog('open').dialog('setTitle', '编辑用户');
            $('#fm').form('load', row);
            //参数在这里传进去，后面的 save 就不传了
            url = '${pageContext.request.contextPath}/modifyUserServlet?userId=' + row.userId;
        }
    }
    function saveUser() {
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
    function destroyUser() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', '确定要删除该用户?', function(r) {
                if (r) {
                    $.post('${pageContext.request.contextPath}/deleteUserServlet', {
                        userId : row.userId
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
                field : 'userId', //绑定数据源ID
                title : 'userId', //显示列名称
                align : 'center', //内容在列居中
                width : 100 ,//列的宽度
                hidden : true
            },
            {
                field : 'username',
                title : '用户名',
                align : 'center',
                width : 100
            },
            {
                field : 'number',
                title : '学号',
                align : 'center',
                width : 100
            },
            {
                field : 'roleType',
                title : '角色类型',
                align : 'center',
                width : 100,
                hidden : true
            },
            {
                field : 'roleName',
                title : '用户角色',
                align : 'center',
                width : 100
            },
        ] ],
        pagination : true, //开启分页
        url : '${pageContext.request.contextPath}/userListServlet', //获取数据地址
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
</script>