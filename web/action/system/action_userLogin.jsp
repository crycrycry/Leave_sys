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

    System.out.println(username+password);



%>
