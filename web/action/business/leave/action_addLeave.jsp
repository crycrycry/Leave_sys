<%@ page import="java.sql.Connection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
    String leave_reason = request.getParameter("leave_reason");
    String leave_dayNum = request.getParameter("leave_dayNum");
    String leave_applyTime = request.getParameter("leave_applyTime");

    HttpSession sessions = request.getSession();

    User user = (User) sessions.getAttribute("user");

    Connection conn = getConn();

    Date date = new Date();

    SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmsss");

    String leave_id = sdf.format(date) + (int)(Math.random()*(999-100+1));

    System.out.println(leave_id);

    String sql = "insert sys_leave(leave_id,course_id,leave_reason,leave_dayNum,stu_id,leave_applyTime) value (?,?,?,?,?,?) ";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);
    preparedStatement.setString(1,leave_id);
    preparedStatement.setString(2,course_id);
    preparedStatement.setString(3,leave_reason);
    preparedStatement.setString(4,leave_dayNum);
    preparedStatement.setString(5,user.getStudent().getStuId());
    preparedStatement.setString(6,leave_applyTime);

    preparedStatement.execute();

    close(preparedStatement,conn);

    request.setAttribute("msg","添加成功");

    process(request,response,"/action/business/leave/action_leaveList.jsp");
%>
