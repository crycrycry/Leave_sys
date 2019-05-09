<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.logging.SimpleFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    String leave_opinion = request.getParameter("leave_opinion");
    String leave_status = request.getParameter("leave_status");
    Date date = new Date();

    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

    try {

        Connection conn = getConn();

        String sql = "update sys_leave set leave_opinion = ? , leave_status = ? , leave_auditTime = ? where leave_id = ?";

        System.out.println(leave_opinion + "\t" + leave_status + "\t" + date + "\t" + leave_id +"\t"+ "\n" + sql);

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1, leave_opinion);
        preparedStatement.setString(2, leave_status);
        preparedStatement.setString(3, sdf.format(date));
        preparedStatement.setString(4, leave_id);

        preparedStatement.executeUpdate();

        close(preparedStatement, conn);

        request.setAttribute("msg", "审批成功");

        close(preparedStatement,conn);

        process(request, response, "/action/business/approval/action_approvalList.jsp");

    }catch (Exception e){

        e.printStackTrace();

        request.setAttribute("msg", "审批失败");

        process(request, response, "/action/business/approval/action_approvalList.jsp");
    }
%>

