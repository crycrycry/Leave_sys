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

    Connection conn = getConn();

    switch (user.getUserType()){
        case 1://学生

            String stu_name = request.getParameter("stu_name");
            String stu_sex = request.getParameter("stu_sex");
            String stu_address = request.getParameter("stu_address");
            String stu_telephone = request.getParameter("stu_telephone");
            String stu_contact = request.getParameter("stu_contact");
            String stu_contactTel = request.getParameter("stu_contactTel");

            String sql_student = "update sys_student set stu_name = ? ,stu_sex = ?,stu_address = ?,stu_telephone = ?,stu_contact = ? , stu_contactTel = ? WHERE user_id = ?";

            PreparedStatement preparedStatement_student = conn.prepareStatement(sql_student);

            preparedStatement_student.setString(1,stu_name);
            preparedStatement_student.setString(2,stu_sex);
            preparedStatement_student.setString(3,stu_address);
            preparedStatement_student.setString(4,stu_telephone);
            preparedStatement_student.setString(5,stu_contact);
            preparedStatement_student.setString(6,stu_contactTel);
            preparedStatement_student.setInt(7,user.getUserId());

            preparedStatement_student.executeUpdate();

            close(preparedStatement_student);//关闭资源

            break;
        case 2://老师

            String inst_name = request.getParameter("inst_name");

            String inst_telephone = request.getParameter("inst_telephone");

            String sql_techer = "update sys_teacher set inst_name = ? , inst_telephone = ? where user_id = ?";

            PreparedStatement preparedStatement_teacher = conn.prepareStatement(sql_techer);

            preparedStatement_teacher.setString(1,inst_name);

            preparedStatement_teacher.setString(2,inst_telephone);

            preparedStatement_teacher.setInt(3,user.getUserId());

            preparedStatement_teacher.executeUpdate();

            break;
        case 3://管理员

            String full_name = request.getParameter("full_name");

            String admin_telephone = request.getParameter("admin_telephone");

            String sql_admin = "update sys_admin set admin_full_name = ? , admin_telephone = ? where user_id = ?";

            PreparedStatement preparedStatement = conn.prepareStatement(sql_admin);

            preparedStatement.setString(1,full_name);

            preparedStatement.setString(2,admin_telephone);

            preparedStatement.setInt(3,user.getUserId());

            preparedStatement.executeUpdate();

            break;
    }

    sessions.invalidate();

    response.sendRedirect(path+"/page/system/login.jsp");
%>