<%--
  Created by IntelliJ IDEA.
  program: Leave_sys
  Author: 麦奇
  Email： 1625017540@qq.com
  Date: 4/23/19
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<%@ include file="/page/utils/database.jsp"%>
<%
    List<Course> courses = null;

    Course course = null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_course limit ?,?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setInt(1,start);
    preparedStatement.setInt(2,total);

    ResultSet resultSet = preparedStatement.executeQuery();

    courses = new ArrayList<Course>();

   while (resultSet.next()){
       course = new Course();

       course.setCourseId(resultSet.getString("course_id"));
       course.setClassId(resultSet.getString("class_id"));
       course.setCourseName(resultSet.getString("course_name"));
       course.setCourseYear(resultSet.getString("course_year"));
       course.setCourseTerm(resultSet.getString("course_term"));
       course.setCourseHour(resultSet.getInt("course_hour"));
       course.setCourseMajor(resultSet.getString("course_major"));
       course.setCourseGrade(resultSet.getString("course_grade"));

       courses.add(course);
   }

   close(resultSet,preparedStatement,conn);

   request.setAttribute("courses",courses);

   process(request,response,"/page/business/course/courseList.jsp");

%>