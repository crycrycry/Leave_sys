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
    String class_id = request.getParameter("class_id");
    String class_name = request.getParameter("class_name");
    String dep_id = request.getParameter("dep_id");
    String class_major = request.getParameter("class_major");
    String class_grade = request.getParameter("class_grade");

    Connection conn = getConn();

    String sql = "update sys_classes set class_name = ?,dep_id = ?,class_major = ?,class_grade = ? where class_id = ?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);


    preparedStatement.setString(1,class_name);
    preparedStatement.setString(2,dep_id);
    preparedStatement.setString(3,class_major);
    preparedStatement.setString(4,class_grade);
    preparedStatement.setString(5,class_id);

    preparedStatement.executeUpdate();

    close(preparedStatement,conn);

    request.setAttribute("msg","修改成功");

    process(request,response,"/action/business/class/action_classList.jsp");
%>

