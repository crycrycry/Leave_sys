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
    String course_id = request.getParameter("course_id");
    String class_id = request.getParameter("class_id");
    String course_name = request.getParameter("course_name");
    String course_year = request.getParameter("course_year");
    String course_term = request.getParameter("course_term");
    String course_hour = request.getParameter("course_hour");
    String course_major = request.getParameter("course_major");
    String course_grade = request.getParameter("course_grade");

    try {

        Connection conn = getConn();

        String sql = "update sys_course set class_id = ? , course_name = ? , course_year = ? , course_term = ? , course_hour = ? , course_major = ? , course_grade = ? where course_id = ?";

        System.out.println(class_id + "\t" + class_id + "\t" + course_name + "\t" + course_year + "\t" + course_term + "\t" + course_hour + "\t" + course_major + "\t" + course_grade + "\n" + sql);

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1, class_id);
        preparedStatement.setString(2, course_name);
        preparedStatement.setString(3, course_year);
        preparedStatement.setString(4, course_term);
        preparedStatement.setInt(5, Integer.parseInt(course_hour));
        preparedStatement.setString(6, course_major);
        preparedStatement.setString(7, course_grade);
        preparedStatement.setString(8, course_id);

        preparedStatement.executeUpdate();

        close(preparedStatement, conn);

        request.setAttribute("msg", "修改成功");

        process(request, response, "/action/business/course/action_courseList.jsp");

    }catch (Exception e){

        e.printStackTrace();

        request.setAttribute("msg", "修改失败");

        process(request, response, "/action/business/course/action_courseList.jsp");
    }
%>

