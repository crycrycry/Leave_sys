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
    String contentType = request.getContentType();

    String department_id = request.getParameter("department_id");
    String department_name = request.getParameter("department_name");

    Connection conn = getConn();

    String sql = "insert sys_department(dep_id, dep_name) value (?,?) ";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,department_id);

    preparedStatement.setString(2,department_name);

    preparedStatement.execute();

    close(preparedStatement,conn);

    request.setAttribute("msg","添加成功");

    process(request,response,"/action/business/department/action_departmentList.jsp");
%>
