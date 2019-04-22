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
    request.setCharacterEncoding("utf-8");

    String username = request.getParameter("username");

    String password = request.getParameter("password");

    Connection connection = getConn();

    StringBuilder sql = new StringBuilder("select * from sys_user where user_name=? and user_password=?");

    PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());

    preparedStatement.setString(1,username);
    preparedStatement.setString(2,password);

    ResultSet resultSet = preparedStatement.executeQuery();

    if (resultSet.next()){
        User user = new User();
        user.setUserId(resultSet.getInt("user_id"));
        user.setUsername(resultSet.getString("user_name"));
        user.setUserPassword(resultSet.getString("user_password"));
        user.setUserType(resultSet.getInt("user_type"));
        user.setUserAvailable(resultSet.getInt("user_available"));

        request.getSession().setAttribute("user",user);

        process(request, response, "/page/common/main.jsp");
    }else {
        request.setAttribute("login_msg","账号或密码错误！");
        process(request, response, "/page/system/login.jsp");
    }
%>
