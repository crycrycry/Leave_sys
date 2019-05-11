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
    List<Leave> leaves = null;

    Leave leave = null;

    String start1 = request.getParameter("start");//开始下标
    String total1 = request.getParameter("total");//当前页记录数

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;

    HttpSession sessions = request.getSession();

    User user = (User) sessions.getAttribute("user");

    Connection conn = getConn();

    String sql = "select * from sys_leave where stu_id = ? limit ?,?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,user.getStudent().getStuId());

    preparedStatement.setInt(2,start);
    preparedStatement.setInt(3,total);

    ResultSet resultSet = preparedStatement.executeQuery();

    leaves = new ArrayList<Leave>();

   while (resultSet.next()){
       leave = new Leave();

       leave.setLeaveId(resultSet.getString("leave_id"));
       leave.setCourseId(resultSet.getString("course_id"));
       leave.setLeaveReason(resultSet.getString("leave_reason"));
       leave.setLeaveDaynum(resultSet.getInt("leave_dayNum"));
       leave.setStuId(resultSet.getString("stu_id"));
       leave.setLeaveApplytime(resultSet.getDate("leave_applyTime"));
       leave.setLeaveStatus(resultSet.getString("leave_status"));
       leave.setLeaveAudittime(resultSet.getDate("leave_auditTime"));
       leave.setLeaveOpinion(resultSet.getString("leave_opinion"));

       leaves.add(leave);
   }

   close(resultSet,preparedStatement,conn);

   request.setAttribute("leaves",leaves);

   process(request,response,"/page/business/leave/leaveList.jsp");

%>