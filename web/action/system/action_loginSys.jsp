<%@ page import="java.sql.Connection" %>
<%@ include file="/page/utils/database.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 4/17/19
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
  处理用户登陆
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<%
    String dbTableName = null;
    String dbPwd = null;
    String dbUserName = null;


    request.setCharacterEncoding("utf-8");

    String username = request.getParameter("username");

    String password = request.getParameter("password");

    String roleType = request.getParameter("role_type");

    System.out.println("Message = "+username+"\n"+password+"\n"+roleType);

    Connection connection = getConn();

    switch (roleType){
        case "1":
            dbTableName = "sys_student";dbUserName = "student_id";dbPwd = "student_password";
            break;
        case "2":
            dbTableName = "sys_teacher";dbUserName = "teacher_id";dbPwd = "teacher_password";
            break;
        case "3":
            dbTableName = "sys_admin";dbUserName = "admin_id";dbPwd = "admin_password";
            break;
    }

    StringBuilder sql = new StringBuilder("select *  from "+dbTableName+" where "+dbUserName+"='"+username+"' and "+dbPwd+"='"+password+"'");

    Statement statement = connection.createStatement();

    ResultSet resultSet = statement.executeQuery(sql.toString());

    System.out.println("login Message = "+sql);

    while (resultSet.next()){
        resultSet.getString()
    }
%>
