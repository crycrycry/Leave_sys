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
    List<Leave> leaves = null;

    Student student = null;

    Leave leave = null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    String search = request.getParameter("search");

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;


    Connection conn = getConn();

    String sql = "select * from sys_leave where leave_id like ? or course_id like ? or leave_reason like ? or leave_dayNum like ? or stu_id like ? or leave_applyTime like ? or leave_status like ? or leave_auditTime like ? or leave_opinion like ?  limit ?,?";

    System.out.println("search_msg:"+search+"\n"+sql);

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,"%"+search+"%");
    preparedStatement.setString(2,"%"+search+"%");
    preparedStatement.setString(3,"%"+search+"%");
    preparedStatement.setString(4,"%"+search+"%");
    preparedStatement.setString(5,"%"+search+"%");
    preparedStatement.setString(6,"%"+search+"%");
    preparedStatement.setString(7,"%"+search+"%");
    preparedStatement.setString(8,"%"+search+"%");
    preparedStatement.setString(9,"%"+search+"%");
    preparedStatement.setInt(10,start);
    preparedStatement.setInt(11,total);

    ResultSet resultSet = preparedStatement.executeQuery();

    leaves = new ArrayList<Leave>();

    while (resultSet.next()){
        leave = new Leave();

        leave.setLeaveId(resultSet.getString("leave_id"));
        leave.setCourseId(resultSet.getString("course_id"));
        leave.setLeaveReason(resultSet.getString("leave_reason"));
        leave.setLeaveDaynum(resultSet.getInt("leave_dayNum"));
        leave.setStuId(resultSet.getString("stu_id"));
        leave.setLeaveApplytime(resultSet.getTime("leave_applyTime"));
        leave.setLeaveStatus(resultSet.getString("leave_status"));
        leave.setLeaveAudittime(resultSet.getTime("leave_auditTime"));
        leave.setLeaveOpinion(resultSet.getString("leave_opinion"));

        String sql_student = "select * from sys_student ss where ss.stu_id = ?";

        PreparedStatement preparedStatement_student = conn.prepareStatement(sql_student);

        preparedStatement_student.setString(1,leave.getStuId());

        ResultSet stu= preparedStatement_student.executeQuery();

        while (stu.next()) {

            student = new Student();

            student.setStuId(stu.getString("stu_id"));
            student.setUserId(stu.getInt("user_id"));
            student.setClassId(stu.getString("class_id"));
            student.setStuName(stu.getString("stu_name"));
            student.setStuSex(stu.getString("stu_sex"));
            student.setStuAddress(stu.getString("stu_address"));
            student.setStuTelephone(stu.getString("stu_telephone"));
            student.setStuContact(stu.getString("stu_contact"));
            student.setStuContactTel(stu.getString("stu_contactTel"));

            leave.setStudent(student);
        }
        leaves.add(leave);
    }

    request.setAttribute("leaves",leaves);

    process(request,response,"/page/business/approval/approvalList.jsp");
%>

