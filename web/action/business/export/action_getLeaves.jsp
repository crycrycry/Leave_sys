<%--
  Created by IntelliJ IDEA.
  program: Leave_sys
  Author: 麦奇
  Email： 1625017540@qq.com
  Date: 5/10/19
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<%@ include file="/page/utils/database.jsp"%>

<%!
    public List<Leave> getLeaves(String searchTeam, String searchClasses, String searchkey) throws Exception {

        List<Leave> leaves = new ArrayList<Leave>();

        Connection conn = getConn();

        int flag = 0;
        //查询假条
        StringBuilder sql = new StringBuilder("select * from sys_leave sl,sys_student ss,sys_course sc,sys_classes scl where sl.stu_id=ss.stu_id and sl.course_id = sc.course_id and sc.class_id = scl.class_id and sc.course_term = ? and scl.class_id = ?");

        PreparedStatement preparedStatement = conn.prepareStatement(sql.toString());

        preparedStatement.setString(1, searchTeam);
        preparedStatement.setString(2, searchClasses);

        System.out.println("导出=Message:\nsql\n"+sql+"\nsearchTeam="+searchTeam+"\nsearchClasses="+searchClasses+"\nsearchkey="+searchkey+"\n"+flag);

        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            Leave leave = new Leave();
            leave.setLeaveId(resultSet.getString("leave_id"));
            leave.setCourseId(resultSet.getString("course_id"));
            leave.setLeaveReason(resultSet.getString("leave_reason"));
            leave.setLeaveDaynum(resultSet.getInt("leave_dayNum"));
            leave.setStuId(resultSet.getString("stu_id"));
            leave.setLeaveApplytime(resultSet.getTime("leave_applyTime"));
            leave.setLeaveStatus(resultSet.getString("leave_status"));
            leave.setLeaveAudittime(resultSet.getTime("leave_auditTime"));
            leave.setLeaveOpinion(resultSet.getString("leave_opinion"));

            Student student = new Student();
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

            Course course = new Course();
            course.setCourseId(resultSet.getString("course_id"));
            course.setClassId(resultSet.getString("class_id"));
            course.setCourseName(resultSet.getString("course_name"));
            course.setCourseYear(resultSet.getString("course_year"));
            course.setCourseTerm(resultSet.getString("course_term"));
            course.setCourseHour(resultSet.getInt("course_hour"));
            course.setCourseMajor(resultSet.getString("course_major"));
            course.setCourseGrade(resultSet.getString("course_grade"));
            leave.setCourse(course);

            leaves.add(leave);
        }
        close(resultSet,preparedStatement,conn);

       return leaves;
    }

%>
