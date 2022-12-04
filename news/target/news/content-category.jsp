<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table id="dg" style="width:800px" title="新闻列表" rownumbers="true"
       data-options="fit:true" toolbar="#toolbar" fitColumns="true"
       singleSelect="true"></table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newType()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editType()">编辑</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="destroyType()">删除</a>
</div>
<div id="dlg" class="easyui-dialog"
     style="width:400px;height:200px;padding:10px 20px" closed="true"
     buttons="#dlg-buttons2">
    <form id="fm" method="post">
        <input type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>ID:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="typeId" data-options="required:true" style="width: 280px;" disabled></input></td>
                </td>
            </tr>
            <tr>
                <td>分类:</td>
                <td><input class="easyui-textbox" type="text" name="typeName" data-options="required:true" style="width: 280px;"></input></td>
            </tr>
        </table>
    </form>
</div>
<div id="add_dlg" class="easyui-dialog"
     style="width:400px;height:200px;padding:10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="add_fm" method="post">
        <input type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>分类:</td>
                <td><input class="easyui-textbox" type="text" name="typeName" data-options="required:true" style="width: 280px;"></input></td>
            </tr>
        </table>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveType2()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#add_dlg').dialog('close')">取消</a>
</div>
<div id="dlg-buttons2">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveType()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
<script>
    function newType() {
        $('#add_dlg').dialog('open').dialog('setTitle', '新增分类');
        $('#add_fm').form('clear');
        url = '${pageContext.request.contextPath}/addTypeServlet';
    }
    function editType() {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $('#dlg').dialog('open').dialog('setTitle', '编辑分类');
            $('#fm').form('load', row);
            //参数在这里传进去，后面的 save 就不传了
            url = '${pageContext.request.contextPath}/modifyTypeServlet?typeId=' + row.typeId;
        }
    }
    function saveType() {
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
    function saveType2() {
        $('#add_fm').form('submit', {
            url : url,
            onSubmit : function() {
                return $(this).form('validate');
            },
            success : function() {
                alert("新增成功");
                $('#add_dlg').dialog('close');
                $('#dg').datagrid('reload');
            }
        });
    }
    function destroyType() {
        var row = $('#dg').datagrid('getSelected');
        if (row.typeId == 1)
        {
            alert("该分类无法删除");
        }
        else{
            if (row) {
                $.messager.confirm('Confirm', '确定要删除该分类?', function(r) {
                    if (r) {
                        $.post('${pageContext.request.contextPath}/deleteTypeServlet', {
                            typeId : row.typeId
                        }, function(result) {
                            $('#dg').datagrid('reload');
                        });
                    }
                });
            }
        }
    }
    $('#dg').datagrid({
        columns : [ [ //添加列
            {
                field : 'typeId', //绑定数据源ID
                title : 'ID', //显示列名称
                align : 'center', //内容在列居中
                width : 100 ,//列的宽度
            },
            {
                field : 'typeName',
                title : '类型',
                align : 'center',
                width : 100
            },
        ] ],
        pagination : true, //开启分页
        url : '${pageContext.request.contextPath}/typeListServlet', //获取数据地址
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