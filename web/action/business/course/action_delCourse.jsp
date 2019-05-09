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
    String course_id = request.getParameter("course_id");

    Connection conn = getConn();

    String sql = "delete from sys_course where course_id = ?";

    System.out.println(course_id+"\n"+sql);

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,course_id);

    preparedStatement.execute();

    close(preparedStatement,conn);

    close(preparedStatement,conn);

    request.setAttribute("msg","删除成功");

    process(request,response,"/action/business/course/action_courseList.jsp");
%>
