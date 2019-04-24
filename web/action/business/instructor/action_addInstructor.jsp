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
    Integer user_id = null;

    String inst_id = request.getParameter("inst_id");
    String inst_name = request.getParameter("inst_name");
    String dep_id = request.getParameter("dep_id");
    String inst_telephone = request.getParameter("inst_telephone");

    Connection conn = getConn();

    String sql_sys_user = "insert sys_user(user_name,user_type) value (?,?)";

    PreparedStatement preparedStatement_user = conn.prepareStatement(sql_sys_user);

    preparedStatement_user.setString(1,inst_id);

    preparedStatement_user.setInt(2,2);

    preparedStatement_user.execute();

    String select_sql = "select su.user_id from sys_user su where user_name = ?";

    PreparedStatement preparedStatement = conn.prepareStatement(select_sql);

    preparedStatement.setString(1,inst_id);

    ResultSet resultSet = preparedStatement.executeQuery();

    while (resultSet.next()){
        user_id = resultSet.getInt("user_id");break;
    }

//    插入管理员表

    String sql_sys_instructor = "insert sys_instructor(user_id, inst_name,dep_id,inst_telephone) value (?,?,?,?) ";

    PreparedStatement preparedStatement_inst = conn.prepareStatement(sql_sys_instructor);

    preparedStatement_inst.setInt(1,user_id);
    preparedStatement_inst.setString(2,inst_name);
    preparedStatement_inst.setString(3,dep_id);
    preparedStatement_inst.setString(4,inst_telephone);

    preparedStatement_inst.execute();
    close(preparedStatement_inst,conn);

    request.setAttribute("msg","添加成功");

    process(request,response,"/action/business/instructor/action_InstructorList.jsp");
%>
