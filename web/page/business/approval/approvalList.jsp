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
    List<Leave> leaves = new ArrayList<Leave>();

    leaves = (List<Leave>) request.getAttribute("leaves");
%>
<html>
<body>
<%--<form method="post" action="" id="listform">--%>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">假条列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
        <div class="padding border-bottom">
            <form action="<%=path%>/action/business/approval/action_searchApproval.jsp" method="post">
                    <input type="text" placeholder="请输入查询条件" name="search" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <input class="button border-main icon-search" type="submit" value="搜索"></li>
            </form>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <%--请假课程、请假事由,请假天数--%>
                <th width="100" style="text-align:left; padding-left:20px;">序号</th>
                <th width="10%">学生姓名</th>
                <th width="10%">请假课程</th>
                <th width="10%">请假事由</th>
                <th width="10%">请假天数</th>
                <th width="10%">请假时间</th>
                <th width="10%">审核时间</th>
                <th width="10%">审核意见</th>
                <th width="10%">状态</th>
                <th width="310">操作</th>
            </tr>
            <volist name="list" id="vo">

                <%
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                    int i = 0;
                    for (Leave leave : leaves) {
                %>
                <tr>
                    <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" /><%=++i%></td>
                    <td><%=leave.getStudent().getStuName()%></td>
                    <td><%=leave.getCourseId()%></td>
                    <td><%=leave.getLeaveReason()%></td>
                    <td><%=leave.getLeaveDaynum()%></td>
                    <%--<fmt:formatDate value=<%=leave.getLeaveApplytime()%> pattern="yyyy-MM-dd HH:mm:ss"/>--%>
                    <td><%=sdf.format(leave.getLeaveApplytime())%></td>
                    <td><%=leave.getLeaveAudittime()!=null?sdf.format(leave.getLeaveAudittime()):"暂无"%></td>
                    <td><%=leave.getLeaveOpinion()!=null?leave.getLeaveOpinion():"暂无"%></td>
                    <td><%
                        switch (Integer.parseInt(leave.getLeaveStatus())){
                        case 0:
                            out.print("待审批");
                            break;
                        case 1:
                            out.print("已通过");
                            break;
                        case 2:
                            out.print("未通过");
                            break;
                    }%></td>
                    <td><div class="button-group">
                        <%--<a class="button border-main" href="<%=path%>/page/business/approval/approvalDeatil.jsp?leave_id=<%=leave.getLeaveId()%>">--%>
                            <%--<span class="icon-edit"></span>预览</a>--%>

                        <a class="button border-main" onclick="leaveDetail('<%=leave.getLeaveId()%>')" href="#">
                            <span class="icon-edit"></span>预览</a>

                    </div></td>
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

    function leaveDetail(leaveIds) {

        console.log(leaveIds);

        layer.open({
            type: 2,
            skin: 'layui-layer-rim', //加上边框
            area: ['90%', '90%'], //宽高
            content: '<%=basePath%>page/business/approval/approvalDeatil.jsp?leave_id='+leaveIds
        });
    }


    //不同意
    function pass(leaveId){
        if(confirm("您确定要删除吗?")){
            window.open("<%=path%>/action/business/approval/action_delLeave.jsp?leave_id="+leaveId,"_self");
        }
    }
    //不同意
    function nopass(leaveId){
        if(confirm("您确定要删除吗?")){
            window.open("<%=path%>/action/business/approval/action_delLeave.jsp?leave_id="+leaveId,"_self");
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