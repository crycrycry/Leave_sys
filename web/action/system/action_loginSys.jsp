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

        switch (user.getUserType()){
            case 1:
                PreparedStatement preparedStatement1 = connection.prepareStatement("select * from sys_student where user_id = ?");
                preparedStatement1.setInt(1,user.getUserId());

                ResultSet resultSet1 = preparedStatement1.executeQuery();

                if (resultSet1.next()){
                    Student student = new Student();

                    student.setStuId(resultSet1.getString("stu_id"));
                    student.setUserId(resultSet1.getInt("user_id"));
                    student.setClassId(resultSet1.getString("class_id"));
                    student.setStuName(resultSet1.getString("stu_name"));
                    student.setStuSex(resultSet1.getString("stu_sex"));
                    student.setStuAddress(resultSet1.getString("stu_address"));
                    student.setStuTelephone(resultSet1.getString("stu_telephone"));
                    student.setStuContact(resultSet1.getString("stu_contact"));
                    student.setStuContactTel(resultSet1.getString("stu_contactTel"));

                    user.setStudent(student);
                    close(preparedStatement1,resultSet1);
                }


                break;
            case 2:
                PreparedStatement preparedStatement2 = connection.prepareStatement("select * from sys_instructor where user_id = ?");

                preparedStatement2.setInt(1,user.getUserId());

                ResultSet resultSet2 = preparedStatement2.executeQuery();

                if (resultSet2.next()){
                    Instructor instructor = new Instructor();

                    instructor.setDepId(resultSet2.getString("inst_id"));
                    instructor.setDepId(resultSet2.getString("dep_id"));
                    instructor.setUserId(resultSet2.getInt("user_id"));
                    instructor.setInstName(resultSet2.getString("inst_name"));
                    instructor.setInstTelephone(resultSet2.getString("inst_telephone"));

                    user.setInstructor(instructor);
                    close(preparedStatement2,resultSet2);
                }
                break;
            case 3:
                PreparedStatement preparedStatement3 = connection.prepareStatement("select * from sys_admin where user_id = ?");

                preparedStatement3.setInt(1,user.getUserId());

                ResultSet resultSet3 = preparedStatement3.executeQuery();

                if (resultSet3.next()){
                    Admin admin = new Admin();

                    admin.setAdminId(resultSet3.getString("admin_id"));
                    admin.setUserId(resultSet3.getInt("user_id"));
                    admin.setAdminName(resultSet3.getString("admin_full_name"));
                    admin.setAdminTelephone(resultSet3.getString("admin_telephone"));

                    user.setAdmin(admin);

                    close(preparedStatement3,resultSet3);

                    break;
        }
        }
        request.getSession().setAttribute("user",user);
        process(request, response, "/page/common/main.jsp");

    }else {

        request.setAttribute("login_msg","账号或密码错误！");

        process(request, response, "/page/system/login.jsp");

    }
    //关闭连接/home/mikey/MIKEY/MIKEY/IDEAWorkSpace/Leave_sys/web
    close(resultSet,preparedStatement,connection);
%>
