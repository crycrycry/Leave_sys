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

    String department_id = request.getParameter("department_id");

    String department_name = request.getParameter("department_name");

    Connection conn = getConn();

    String sql = "update sys_department set dep_name = ? where dep_id = ?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,department_name);

    preparedStatement.setString(2,department_id);

    preparedStatement.executeUpdate();

    request.setAttribute("msg","修改成功");

    process(request,response,"/action/business/department/departmentList.jsp");
%>

