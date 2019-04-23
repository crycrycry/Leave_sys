<%--
  Created by IntelliJ IDEA.
  program: Leave_sys
  Author: 麦奇
  Email： 1625017540@qq.com
  Date: 4/23/19
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--更改密码--%>
<%@ include file="/page/utils/database.jsp"%>
<%@ include file="/page/common/base.jsp"%>
<%
    HttpSession sessions = request.getSession();

    User user = (User) sessions.getAttribute("user");

    String mpass = request.getParameter("mpass");
    String password = request.getParameter("renewpass");

    if (!user.getUserPassword().equals(mpass)){
        request.setAttribute("msg","原密码错误");
        process(request,response,"/page/system/password.jsp");
        return;
    }else {
        Connection conn = getConn();

        String sql = "update sys_user set user_password = ? where user_id = ? and user_password = ?";

        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, password);
        preparedStatement.setInt(2, user.getUserId());
        preparedStatement.setString(3, mpass);

        preparedStatement.executeUpdate();

        sessions.invalidate();

        response.sendRedirect(path + "/page/system/login.jsp");
    }
%>