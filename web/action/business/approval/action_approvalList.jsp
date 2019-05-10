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

    Student student = null;

    String start1 = request.getParameter("start");//开始下标

    String total1 = request.getParameter("total");//当前页记录数

    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;

    HttpSession sessions = request.getSession();

    User user = (User) sessions.getAttribute("user");


    Connection conn = getConn();

    String sql = "select * from sys_leave sl , sys_student ss ,sys_classes sc where sl.stu_id = ss.stu_id and ss.class_id=sc.class_id and dep_id = ? limit ?,?";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    preparedStatement.setString(1,user.getInstructor().getDepId());
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
       leave.setLeaveApplytime(resultSet.getTime("leave_applyTime"));
       leave.setLeaveStatus(resultSet.getString("leave_status"));
       leave.setLeaveAudittime(resultSet.getTime("leave_auditTime"));
       leave.setLeaveOpinion(resultSet.getString("leave_opinion"));

       student = new Student();

       student.setStuId(resultSet.getString("stu_id"));
       student.setUserId(resultSet.getInt("user_id"));
       student.setClassId(resultSet.getString("class_id"));
       student.setStuName(resultSet.getString("stu_name"));
       student.setStuSex(resultSet.getString("stu_sex"));
       student.setStuAddress(resultSet.getString("stu_address"));
       student.setStuTelephone(resultSet.getString("stu_telephone"));
       student.setStuContact(resultSet.getString("stu_contact"));
       student.setStuContactTel(resultSet.getString("stu_contactTel"));

       leave.setStudent(student);

       leaves.add(leave);
   }

   close(resultSet,preparedStatement,conn);

   request.setAttribute("leaves",leaves);

   process(request,response,"/page/business/approval/approvalList.jsp");

%>