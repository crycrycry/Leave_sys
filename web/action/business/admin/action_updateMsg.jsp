<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 4/22/19
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/utils/database.jsp"%>
<%@ include file="/page/common/base.jsp"%>
<%
    HttpSession sessions = request.getSession();

    User user = (User) sessions.getAttribute("user");

    System.out.println("roleType:"+user.getUserType());

    switch (user.getUserType()){
        case 1://学生

            break;
        case 2://老师

            break;
        case 3://管理员

            String full_name = request.getParameter("full_name");

            String admin_telephone = request.getParameter("admin_telephone");

            String sql = "update sys_admin set admin_full_name = ? , admin_telephone = ? where user_id = ?";

            Connection conn = getConn();

            PreparedStatement preparedStatement = conn.prepareStatement(sql);

            preparedStatement.setString(1,full_name);

            preparedStatement.setString(2,admin_telephone);

            preparedStatement.setInt(3,user.getUserId());

            preparedStatement.executeUpdate();

            sessions.invalidate();

            response.sendRedirect(path+"/page/system/login.jsp");

            break;
    }
%>