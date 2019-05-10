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
    List<String> termList = new ArrayList<String>();//学期
    List<Classes> classes = new ArrayList<Classes>();//班级
    List<Course> courses = new ArrayList<Course>();//课程

    Connection conn = getConn();

    //查询学期
    PreparedStatement preparedStatement_term = conn.prepareStatement("select distinct(sc.course_term) from sys_course sc");
    ResultSet resultSetTerm = preparedStatement_term.executeQuery();
    while (resultSetTerm.next()){
        String term = resultSetTerm.getString("course_term");
        termList.add(term);
    }
    request.setAttribute("terms",termList);
    //查询班级
    PreparedStatement preparedStatementClass = conn.prepareStatement("select * from sys_classes");
    ResultSet resultSetClass = preparedStatementClass.executeQuery();
    while (resultSetClass.next()){
        Classes classe = new Classes();
        classe.setClassId(resultSetClass.getString("class_id"));
        classe.setClassName(resultSetClass.getString("class_name"));
        classe.setDepId(resultSetClass.getString("dep_id"));
        classe.setClassMajor(resultSetClass.getString("class_major"));
        classe.setClassGrade(resultSetClass.getString("class_grade"));
        classes.add(classe);
    }

    close(preparedStatement_term,resultSetTerm);
    close(resultSetClass,preparedStatementClass,conn);

    request.setAttribute("classes",classes);

    process(request,response,"/page/business/export/outputList.jsp");

%>