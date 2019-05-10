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
//    String dep_id = request.getParameter("dep_id");
    String class_major = request.getParameter("class_major");
    String class_grade = request.getParameter("class_grade");
    HttpSession sessions = request.getSession();
    User user = (User) sessions.getAttribute("user");

    Connection conn = getConn();

    String sql = "insert sys_classes(class_id,class_name,dep_id,class_major,class_grade) value (?,?,?,?,?) ";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,class_id);
    preparedStatement.setString(2,class_name);
//    preparedStatement.setString(3,dep_id);
    preparedStatement.setString(3,user.getInstructor().getDepId());//当前辅导员只能添加本学院的班级
    preparedStatement.setString(4,class_major);
    preparedStatement.setString(5,class_grade);

    preparedStatement.execute();

    close(preparedStatement,conn);

    request.setAttribute("msg","添加成功");

    process(request,response,"/action/business/class/action_classList.jsp");
%>
