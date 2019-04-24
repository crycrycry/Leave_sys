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
    List<Department> departments = null;

    Department department = null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    String search = request.getParameter("search");

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_department where dep_name like ? limit ?,?";

    System.out.println("search_msg:"+search+"\n"+sql);

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,"%"+search+"%");
    preparedStatement.setInt(2,start);
    preparedStatement.setInt(3,total);

    ResultSet resultSet = preparedStatement.executeQuery();

    departments = new ArrayList<Department>();

    while (resultSet.next()){
        department = new Department();

        department.setDepId(resultSet.getString("dep_id"));
        department.setDepName(resultSet.getString("dep_name"));

        departments.add(department);
    }

    request.setAttribute("departments",departments);

    process(request,response,"/page/business/department/departmentList.jsp");

%>

