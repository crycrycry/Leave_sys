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
    List<Instructor> instructors = null;

    Instructor instructor = null;

    List<Department> departments = null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_instructor limit ?,?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setInt(1,start);
    preparedStatement.setInt(2,total);

    ResultSet resultSet = preparedStatement.executeQuery();

    instructors = new ArrayList<Instructor>();

   while (resultSet.next()){
       instructor = new Instructor();

       instructor.setUserId(resultSet.getInt("user_id"));
       instructor.setInstName(resultSet.getString("inst_name"));
       instructor.setDepId(resultSet.getString("dep_id"));
       instructor.setInstTelephone(resultSet.getString("inst_telephone"));

       instructors.add(instructor);
   }

   String sql_dept = "select * from sys_department";

    PreparedStatement preparedStatement_dept = conn.prepareStatement(sql_dept);

    ResultSet resultSetDept = preparedStatement_dept.executeQuery();

    departments = new ArrayList<Department>();

    while (resultSetDept.next()){

        Department department = new Department();

        department.setDepId(resultSetDept.getString("dep_id"));
        department.setDepName(resultSetDept.getString("dep_name"));

        departments.add(department);
    }

    request.setAttribute("departments",departments);

   request.setAttribute("instructors",instructors);

   process(request,response,"/page/business/instructor/instructorList.jsp");

%>