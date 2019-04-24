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
    String user_id = request.getParameter("user_id");

    User user = null;

    Instructor instructor= null;

    if (user_id!=null&&user_id!=""){

        Connection conn = getConn();

        String sql_user = "select * from sys_user where user_id = ?";

        PreparedStatement preparedStatement_user = conn.prepareStatement(sql_user);

        preparedStatement_user.setInt(1,Integer.parseInt(user_id));

        ResultSet resultSetUser = preparedStatement_user.executeQuery();

        if (resultSetUser.next()){
            user = new User();

            user.setUserId(resultSetUser.getInt("user_id"));
            user.setUsername(resultSetUser.getString("user_name"));
            user.setUserPassword(resultSetUser.getString("user_password"));
            user.setUserType(resultSetUser.getInt("user_type"));
            user.setUserAvailable(resultSetUser.getInt("user_available"));
        }

        String sql = "select * from sys_instructor where user_id = ?";

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1,user_id);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()){
            instructor = new Instructor();
            instructor.setInstId(resultSet.getString("inst_id"));
            instructor.setUserId(resultSet.getInt("user_id"));
            instructor.setInstName(resultSet.getString("inst_name"));
            instructor.setDepId(resultSet.getString("dep_id"));
            instructor.setInstTelephone(resultSet.getString("inst_telephone"));

            user.setInstructor(instructor);
        }
    }

%>
<!DOCTYPE html>
<html lang="zh-cn">
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改个人信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="<%=path%>/action/business/instructor/<%=user_id!=null?"action_updateInstructor.jsp":"action_addInstructor.jsp"%>">
            <div class="clear"></div>
            <%--辅导员编号、所属二级学院、辅导员名称、联系电话--%>
            <%if (instructor!=null){%>
                <input type="hidden" value="<%=instructor.getInstId()%>" name="inst_id_pri">
            <%}%>
            <div class="form-group">
                <div class="label">
                    <label>辅导员编号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="inst_id" <%if (instructor!=null){out.print("readonly='readonly'");}%> value="<%=instructor!=null?user.getUsername():""%>"  data-validate="required:辅导员编号不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>所属二级学院：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="dep_id" value="<%=instructor!=null?instructor.getDepId():""%>"  data-validate="required:所属二级学院不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>辅导员名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="inst_name" value="<%=instructor!=null?instructor.getInstName():""%>"  data-validate="required:辅导员名称不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>联系电话：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="inst_telephone" value="<%=instructor!=null?instructor.getInstTelephone():""%>"  data-validate="required:联系电话不能为空;" />
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

