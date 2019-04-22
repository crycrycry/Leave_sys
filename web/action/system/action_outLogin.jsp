<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 4/22/19
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<%--推出登入--%>

<%
    HttpSession sessions = request.getSession();

    sessions.invalidate();

    process(request,response,"/page/system/login.jsp");
%>