<%@ page import="java.sql.Connection" %>
<%@ include file="/page/utils/database.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 4/22/19
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<body>
<%
    HttpSession sessions = request.getSession();

    User user = (User) sessions.getAttribute("user");

    String sql = null;

    switch (user.getUserType()){
        case 1:
            sql = "select * from sys_student where user_id = ?";
            break;
        case 2:
            sql = "select * from sys_teacher where user_id = ?";
            break;
        case 3:
            sql = "select * from sys_admin where user_id = ?";
            break;
    }

    Connection connection = getConn();
%>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改个人信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="<%=path%>/action/business/admin/action_updateMsg.jsp">
            <div class="clear"></div>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="full_name" value="0"  data-validate="required:姓名不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>密码：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<script src="js/laydate/laydate.js"></script>--%>
                    <%--<input type="text" class="laydate-icon input w50" name="datetime" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="form-group">
                <div class="label">
                    <label>手机号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="admin_telephone" value=""  data-validate="required:手机号不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>点击次数：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<input type="text" class="input w50" name="views" value="" data-validate="member:只能为数字"  />--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body></html>

