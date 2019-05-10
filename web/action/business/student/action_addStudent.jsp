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
    Integer user_id = null;
    String stu_id = request.getParameter("stu_id");
    String stu_name = request.getParameter("stu_name");
    String class_id = request.getParameter("class_id");
    String stu_sex = request.getParameter("stu_sex");
    String stu_address = request.getParameter("stu_address");
    String stu_telephone = request.getParameter("stu_telephone");
    String stu_contact = request.getParameter("stu_contact");
    String stu_contactTel = request.getParameter("stu_contactTel");

    synchronized (this) {

        Connection conn = getConn();
        //插入用户表
        String sql = "insert sys_user(user_name,user_type) value (?,?)";

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1, stu_id);

        preparedStatement.setInt(2, 1);

        preparedStatement.execute();

        //查询用户表
        String sql_user = "select user_id from sys_user where user_name = ?";

        PreparedStatement preparedStatement_user = conn.prepareStatement(sql_user);

        preparedStatement_user.setString(1, stu_id);

        ResultSet resultSet = preparedStatement_user.executeQuery();

        while (resultSet.next()) {
            user_id = resultSet.getInt("user_id");
        }

        //插入学生表
        String sql_stu = "insert sys_student value (?,?,?,?,?,?,?,?,?) ";

        System.out.println(sql_stu+"\n"+user_id+"\n"+sql_stu);

        PreparedStatement preparedStatement_stu = conn.prepareStatement(sql_stu);
        preparedStatement_stu.setString(1, stu_id);
        preparedStatement_stu.setInt(2, user_id);
        preparedStatement_stu.setString(3, class_id);
        preparedStatement_stu.setString(4, stu_name);
        preparedStatement_stu.setString(5, stu_sex);
        preparedStatement_stu.setString(6, stu_address);
        preparedStatement_stu.setString(7, stu_telephone);
        preparedStatement_stu.setString(8, stu_contact);
        preparedStatement_stu.setString(9, stu_contactTel);

        preparedStatement_stu.execute();

        close(resultSet,preparedStatement, conn);

        request.setAttribute("msg", "添加成功");

        process(request, response, "/action/business/student/action_studentList.jsp");
    }
%>
