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
    List<Classes> classes = null;

    Classes classe = null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    String search = request.getParameter("search");

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_classes where class_name like ? or dep_id like ? or class_major = ? or class_grade = ? limit ?,?";

    System.out.println("search_msg:"+search+"\n"+sql);

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,"%"+search+"%");
    preparedStatement.setString(2,"%"+search+"%");
    preparedStatement.setString(3,"%"+search+"%");
    preparedStatement.setString(4,"%"+search+"%");
    preparedStatement.setInt(5,start);
    preparedStatement.setInt(6,total);

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

