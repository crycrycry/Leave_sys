<%@ page import="java.sql.Connection" %>
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
    String leave_id = request.getParameter("leave_id");
    String course_id = request.getParameter("course_id");
    String leave_reason = request.getParameter("leave_reason");
    String leave_dayNum = request.getParameter("leave_dayNum");
    String leave_applyTime = request.getParameter("leave_applyTime");

    try {

        Connection conn = getConn();

        String sql = "update sys_leave set course_id = ? , leave_reason = ? , leave_dayNum = ? where leave_id = ?";

        System.out.println(course_id + "\t" + leave_reason + "\t" + leave_dayNum + "\t" + leave_id + "\t" +leave_applyTime+"\t"+ "\n" + sql);

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1, course_id);
        preparedStatement.setString(2, leave_reason);
        preparedStatement.setString(3, leave_dayNum);
        preparedStatement.setString(4, leave_id);

        preparedStatement.executeUpdate();

        close(preparedStatement, conn);

        request.setAttribute("msg", "修改成功");

        process(request, response, "/action/business/leave/action_leaveList.jsp");

    }catch (Exception e){

        e.printStackTrace();

        request.setAttribute("msg", "修改失败");

        process(request, response, "/action/business/leave/action_leaveList.jsp");
    }
%>

