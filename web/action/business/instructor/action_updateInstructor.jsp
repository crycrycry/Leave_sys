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

    String inst_id = request.getParameter("inst_id_pri");
    String inst_name = request.getParameter("inst_name");
    String dep_id = request.getParameter("dep_id");
    String inst_telephone = request.getParameter("inst_telephone");

    System.out.println(inst_id+"\n"+inst_name+"\n"+dep_id+"\n"+inst_telephone);

    Connection conn = getConn();

    String sql = "update sys_instructor set inst_name = ? , dep_id = ? ,inst_telephone = ?  where inst_id = ?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,inst_name);

    preparedStatement.setString(2,dep_id);

    preparedStatement.setString(3,inst_telephone);

    preparedStatement.setString(4,inst_id);

    preparedStatement.executeUpdate();

    close(preparedStatement,conn);

    request.setAttribute("msg","修改成功");

    process(request,response,"/action/business/instructor/action_InstructorList.jsp");
%>

