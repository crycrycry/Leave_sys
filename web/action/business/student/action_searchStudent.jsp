<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mikey.entity.Department" %>
<%@ include file="/page/utils/database.jsp"%>
<%@ include file="/page/common/base.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 4/22/19
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    List<User> users = null;

    User user = null;

    Student student = null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    String search = request.getParameter("search");

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_user su ,sys_student ss where su.user_id = ss.user_id and user_type = 1 and (stu_id like ? or user_name like ? or stu_name like ? or class_id = ? or stu_sex = ? or stu_address like ? or stu_telephone like ? or stu_contact like ? or stu_contactTel like ?)   limit ?,?";

    System.out.println("search_msg:"+search+"\n"+sql);

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,"%"+search+"%");
    preparedStatement.setString(2,"%"+search+"%");
    preparedStatement.setString(3,"%"+search+"%");
    preparedStatement.setString(4,"%"+search+"%");
    preparedStatement.setString(5,"%"+search+"%");
    preparedStatement.setString(6,"%"+search+"%");
    preparedStatement.setString(7,"%"+search+"%");
    preparedStatement.setString(8,"%"+search+"%");
    preparedStatement.setString(9,"%"+search+"%");
    preparedStatement.setInt(10,start);
    preparedStatement.setInt(11,total);

    ResultSet resultSet = preparedStatement.executeQuery();

    users = new ArrayList<User>();

    while (resultSet.next()){

        user = new User();

        user.setUserId(resultSet.getInt("user_id"));
        user.setUsername(resultSet.getString("user_name"));
        user.setUserPassword(resultSet.getString("user_password"));
        user.setUserType(resultSet.getInt("user_type"));
        user.setUserAvailable(resultSet.getInt("user_available"));

        student = new Student();

        student.setStuId(resultSet.getString("stu_id"));
        student.setUserId(resultSet.getInt("user_id"));
        student.setClassId(resultSet.getString("class_id"));
        student.setStuName(resultSet.getString("stu_name"));
        student.setStuSex(resultSet.getString("stu_sex"));
        student.setStuAddress(resultSet.getString("stu_address"));
        student.setStuTelephone(resultSet.getString("stu_telephone"));
        student.setStuContact(resultSet.getString("stu_contact"));
        student.setStuContactTel(resultSet.getString("stu_contactTel"));

        user.setStudent(student);

        users.add(user);
    }

    close(resultSet,preparedStatement,conn);

    request.setAttribute("students",users);

    process(request,response,"/page/business/student/studentList.jsp");

%>

