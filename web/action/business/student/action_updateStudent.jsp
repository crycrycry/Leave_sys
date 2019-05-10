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
    String stu_id = request.getParameter("stu_id");
    String stu_name = request.getParameter("stu_name");
    String class_id = request.getParameter("class_id");
    String stu_sex = request.getParameter("stu_sex");
    String stu_address = request.getParameter("stu_address");
    String stu_telephone = request.getParameter("stu_telephone");
    String stu_contact = request.getParameter("stu_contact");
    String stu_contactTel = request.getParameter("stu_contactTel");

    try {

        Connection conn = getConn();

        String sql = "update sys_student set class_id = ? , stu_name = ? , stu_sex = ? , stu_address = ? , stu_telephone = ? , stu_contact = ? , stu_contactTel = ? where stu_id = ?";

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1, class_id);
        preparedStatement.setString(2, stu_name);
        preparedStatement.setString(3, stu_sex);
        preparedStatement.setString(4, stu_address);
        preparedStatement.setString(5, stu_telephone);
        preparedStatement.setString(6, stu_contact);
        preparedStatement.setString(7, stu_contactTel);
        preparedStatement.setString(8, stu_id);

        preparedStatement.executeUpdate();

        close(preparedStatement, conn);

        request.setAttribute("msg", "修改成功");

        process(request, response, "/action/business/student/action_studentList.jsp");

    }catch (Exception e){

        e.printStackTrace();

        request.setAttribute("msg", "修改失败");

        process(request, response, "/action/business/student/action_studentList.jsp");
    }
%>

