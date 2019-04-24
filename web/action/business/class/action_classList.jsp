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
    List<Classes> classes = null;

    Classes classe= null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_classes limit ?,?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setInt(1,start);
    preparedStatement.setInt(2,total);

    ResultSet resultSet = preparedStatement.executeQuery();

    classes = new ArrayList<Classes>();

   while (resultSet.next()){
       classe = new Classes();

       classe.setClassId(resultSet.getString("class_id"));
       classe.setClassName(resultSet.getString("class_name"));
       classe.setDepId(resultSet.getString("dep_id"));
       classe.setClassMajor(resultSet.getString("class_major"));
       classe.setClassGrade(resultSet.getString("class_grade"));

       classes.add(classe);
   }

   request.setAttribute("classes",classes);

   process(request,response,"/page/business/class/classList.jsp");

%>