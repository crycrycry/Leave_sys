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
    List<Course> courses = null;

    Course course = null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    String search = request.getParameter("search");

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_course where course_id like ? or class_id like ? or course_name = ? or course_year = ? or course_term like ? or course_hour like ? or course_major like ? or course_grade like ?   limit ?,?";

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
    preparedStatement.setInt(9,start);
    preparedStatement.setInt(10,total);

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

    request.setAttribute("courses",courses);

    process(request,response,"/page/business/course/courseList.jsp");

%>

