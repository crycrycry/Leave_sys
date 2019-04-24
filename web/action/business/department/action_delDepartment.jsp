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
    String department_id = request.getParameter("department_id");

    Connection conn = getConn();

    String sql = "delete from sys_department where dep_id = ?";
    System.out.println(department_id+"\n"+sql);
    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,department_id);

    preparedStatement.execute();

    close(preparedStatement,conn);

    request.setAttribute("msg","删除成功");

    process(request,response,"/action/business/department/departmentList.jsp");
%>
