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
    List<Leave> leaves = (List<Leave>) request.getAttribute("leaves");//假条

    List<String> terms = (List<String>) request.getAttribute("terms");//学期

    List<Classes> classes = (List<Classes>) request.getAttribute("classes");//班级
%>
<html>
<body>
<%--<form method="post" action="" id="listform">--%>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">假条列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
        <div class="padding border-bottom">
            <form name="searchOrOutput" method="post" action="<%=path%>/action/business/export/action_searchLeave.jsp">
            <ul class="search" style="padding-left:10px;">
                <li>选择学期
                    <select name="team" class="input" onchange="changesearch()" style="width:60px; line-height:17px; display:inline-block">
                        <%
                            for (String team: terms){
                        %>
                        <option value="<%=team%>"><%=team%></option>
                        <%
                            }
                        %>
                    </select>
                    &nbsp;&nbsp;
                   选择班级
                </li>
                    <li>
                        <select name="classes" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
                            <%
                                for (Classes classe:classes) {
                            %>
                            <option value="<%=classe.getClassId()%>"><%=classe.getClassName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </li>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="searchkey" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <button href="javascript:void(0)" class="button border-main icon-search" type="submit" > 搜索</button></li>
                <li>
                    <%
                        if (leaves!=null){
                    %>
                    <tr>
                        <td width="310">
                            <button class="button border-main" onclick="exportExcel();">导出Excel</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </li>
            </ul>
            </form>
        </div>

        <table class="table table-hover text-center">
            <tr>
                <%--请假课程、请假事由,请假天数--%>
                <th width="100" style="text-align:left; padding-left:20px;">序号</th>
                <th>学生姓名</th>
                <th>请假课程</th>
                <th>请假事由</th>
                <th>请假天数</th>
                <th>请假时间</th>
                <th>审核时间</th>
                <th>审核意见</th>
                    <th>操作</th>
            </tr>
            <volist name="list" id="vo">
                <%
                    if (leaves!=null){
                    int i = 0;
                    for (Leave leave : leaves) {
                %>
                <tr>
                    <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" /><%=++i%></td>
                    <td><%=leave.getStudent().getStuName()%></td>
                    <td><%=leave.getCourse().getCourseName()%></td>
                    <td><%=leave.getLeaveReason()%></td>
                    <td><%=leave.getLeaveDaynum()%></td>
                    <td><%=leave.getLeaveApplytime()%></td>
                    <td><%=leave.getLeaveAudittime()!=null?leave.getLeaveAudittime():"暂无"%></td>
                    <td><%=leave.getLeaveOpinion()!=null?leave.getLeaveOpinion():"暂无"%></td>
                    <td>
                    <div>
                        <a class="button border-main" href="<%=path%>/page/business/export/leaveDeatil.jsp?leave_id=<%=leave.getLeaveId()%>"><span class="icon-edit"></span>预览</a>
                    </div>
                    </td>
                </tr>

                <%
                    }}
                %>
                <tr>
                    <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
                </tr>
        </table>
    </div>
<%--</form>--%>
<script type="text/javascript">

    function exportExcel(){
        document.searchOrOutput.action="<%=path%>/action/business/export/action_OutputExcel.jsp";
        document.searchOrOutput.submit();
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