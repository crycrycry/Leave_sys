<%--
  Created by IntelliJ IDEA.
  program: Leave_sys
  Author: 麦奇
  Email： 1625017540@qq.com
  Date: 4/23/19
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<%@ include file="/page/utils/database.jsp"%>

<%
    List<Classes> classes = new ArrayList<Classes>();

    classes = (List<Classes>) request.getAttribute("classes");
%>
<html>
<body>
<%--<form method="post" action="" id="listform">--%>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">班级列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
        <div class="padding border-bottom">
            <form action="<%=path%>/action/business/class/action_searchClass.jsp" method="post">
                    <input type="text" placeholder="请输入查询条件" name="search" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <input class="button border-main icon-search" type="submit" value="搜索"></li>
                <button type="button" class="button border-yellow" onclick="window.location.href='<%=path%>/page/business/class/addOrUpdateClass.jsp'"><span class="icon-plus-square-o"></span> 添加班级</button>
            </form>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">序号</th>
                <th width="10%">班级编号</th>
                <th width="10%">班级名称</th>
                <th width="10%">二级学院</th>
                <th width="10%">专业</th>
                <th>年级</th>
                <th width="310">操作</th>
            </tr>
            <volist name="list" id="vo">

                <%
                    int i = 0;
                    for (Classes classe : classes) {
                %>
                <tr>
                    <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" /><%=++i%></td>
                    <td><%=classe.getClassId()%></td>
                    <td><%=classe.getClassName()%></td>
                    <td><%=classe.getDepId()%></td>
                    <td><%=classe.getClassMajor()%></td>
                    <td><%=classe.getClassGrade()%></td>
                    <td><div class="button-group"> <a class="button border-main" href="<%=path%>/page/business/class/addOrUpdateClass.jsp?class_id=<%=classe.getClassId()%>"><span class="icon-edit"></span> 修改</a>
                        <a class="button border-red" href="javascript:void(0)" onclick="return del('<%=classe.getClassId()%>')" target="_self">
                            <span class="icon-trash-o"></span> 删除</a> </div></td>
                </tr>

                <%
                    }
                %>
                <tr>
                    <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
                </tr>
        </table>
    </div>
<%--</form>--%>
<script type="text/javascript">

    //单个删除
    function del(classId){
        if(confirm("您确定要删除吗?")){
            window.open("<%=path%>/action/business/class/action_delClass.jsp?class_id="+classId,"_self");
        }
    }

    //全选
    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    //批量删除
    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
            $("#listform").submit();
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    //批量排序
    function sorts(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");
            return false;
        }
    }


    //批量首页显示
    function changeishome(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量推荐
    function changeisvouch(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){


            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量置顶
    function changeistop(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }


    //批量移动
    function changecate(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量复制
    function changecopy(o){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var i = 0;
            $("input[name='id[]']").each(function(){
                if (this.checked==true) {
                    i++;
                }
            });
            if(i>1){
                alert("只能选择一条信息!");
                $(o).find("option:first").prop("selected","selected");
            }else{

                $("#listform").submit();
            }
        }
        else{
            alert("请选择要复制的内容!");
            $(o).find("option:first").prop("selected","selected");
            return false;
        }
    }

</script>
</body>
</html>