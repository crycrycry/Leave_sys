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

    HttpSession sessions = request.getSession();

    User user = (User) sessions.getAttribute("user");

    Connection conn = getConn();

    String sql = "select * from sys_classes,sys_department where sys_department.dep_id = sys_classes.dep_id and sys_department.dep_id =? limit ?,?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,user.getInstructor().getDepId());
    preparedStatement.setInt(2,start);
    preparedStatement.setInt(3,total);

    ResultSet resultSet = preparedStatement.executeQuery();

    classes = new ArrayList<Classes>();

   while (resultSet.next()){
       classe = new Classes();
       Department department = new Department();
       classe.setClassId(resultSet.getString("class_id"));
       classe.setClassName(resultSet.getString("class_name"));
       classe.setDepId(resultSet.getString("dep_id"));
       classe.setClassMajor(resultSet.getString("class_major"));
       classe.setClassGrade(resultSet.getString("class_grade"));

       department.setDepId(resultSet.getString("dep_id"));
       department.setDepName(resultSet.getString("dep_name"));
       classe.setDepartments(department);
       classes.add(classe);
   }

   close(resultSet,preparedStatement,conn);

    System.out.println("班级列表："+classes);

   request.setAttribute("classes",classes);

   process(request,response,"/page/business/class/classList.jsp");

%>