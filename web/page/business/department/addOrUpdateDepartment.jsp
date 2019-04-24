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
<%
    //修改 添加
    String department_id = request.getParameter("department_id");

    Department department = null;

    if (department_id!=null&&department_id!=""){

        Connection conn = getConn();

        String sql = "select * from sys_department where dep_id = ?";

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1,department_id);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()){
            department = new Department();

            department.setDepId(resultSet.getString("dep_id"));
            department.setDepName(resultSet.getString("dep_name"));
        }
    }

%>
<!DOCTYPE html>
<html lang="zh-cn">
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改个人信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="<%=path%>/action/business/department/<%=department_id!=null?"action_updateInstructor.jsp":"action_addInstructor.jsp"%>">
            <div class="clear"></div>
            <div class="form-group">
                <div class="label">
                    <label>二级学院编号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="department_id" <%if (department!=null){out.print("readonly='readonly'");}%> value="<%=department!=null?department.getDepId():""%>"  data-validate="required:学院ID不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>二级学院名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="department_name" value="<%=department!=null?department.getDepName():""%>"  data-validate="required:学院名称不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
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

