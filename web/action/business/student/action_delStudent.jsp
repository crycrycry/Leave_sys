<%@ page import="java.sql.Connection" %><%--
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
    String user_id = request.getParameter("user_id");

    Connection conn = getConn();

    String sql = "delete from sys_student where user_id = ?";

    System.out.println(user_id+"\n"+sql);

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,user_id);

    preparedStatement.execute();

    String sql_user = "delete from sys_user where user_id = ?";

    PreparedStatement preparedStatement_user = conn.prepareStatement(sql_user);

    preparedStatement_user.setInt(1,Integer.parseInt(user_id));

    preparedStatement_user.execute();

    close(preparedStatement,conn);

    close(preparedStatement_user);

    request.setAttribute("msg","删除成功");

    process(request,response,"/action/business/student/action_studentList.jsp");
%>
