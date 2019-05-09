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
    List<Instructor> instructors = null;

    Instructor instructor = null;

    List<Department> departments = new ArrayList<Department>();

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    String search = request.getParameter("search");

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_instructor where inst_id like ? or user_id like ? or inst_name like ? or dep_id like ? or inst_telephone like ? limit ?,?";

    System.out.println("search_msg:"+search+"\n"+sql);

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,"%"+search+"%");
    preparedStatement.setString(2,"%"+search+"%");
    preparedStatement.setString(3,"%"+search+"%");
    preparedStatement.setString(4,"%"+search+"%");
    preparedStatement.setString(5,"%"+search+"%");

    preparedStatement.setInt(6,start);
    preparedStatement.setInt(7,total);

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

    while (resultSetDept.next()){

        Department department = new Department();

        department.setDepId(resultSetDept.getString("dep_id"));
        department.setDepName(resultSetDept.getString("dep_name"));

        departments.add(department);
    }
    close(preparedStatement_dept,resultSetDept);
    close(resultSet,preparedStatement,conn);
    request.setAttribute("instructors",instructors);
    request.setAttribute("departments",departments);
    process(request,response,"/page/business/instructor/instructorList.jsp");

%>

