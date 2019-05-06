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
    List<Leave> leaves = new ArrayList<Leave>();

    Leave leave = null;

    Student student = null;

    List<String> termList = new ArrayList<String>();//学期个数
    List<Classes> classes = new ArrayList<Classes>();//班级
    List<Course> courses = new ArrayList<Course>();//课程

    String start1 = request.getParameter("start");//开始下标
    String total1 = request.getParameter("total");//当前页记录数
    Integer start=start1!=null&&start1!=""?Integer.parseInt(start1):0;
    Integer total=total1!=null&&total1!=""?Integer.parseInt(total1):Integer.MAX_VALUE;

    String searchTeam = request.getParameter("team");//学期
    String searchClasses = request.getParameter("classes");//班级
    String searchkey = request.getParameter("searchkey");//搜索内容

    Connection conn = getConn();

        int flag = 0;
        //查询假条
        StringBuilder sql = new StringBuilder("select * from sys_leave sl left join sys_student ss on sl.stu_id = ss.stu_id left join sys_course on sl.course_id = sys_course.course_id ") ;
        if (searchTeam!=null){
            sql.append("where sys_course.course_term = ?");
        }else if (searchClasses!=null) {
            sql.append("and sys_course.class_id = ? ");
        }else if (searchkey!=null) { }
        sql.append("limit ?,?");

        PreparedStatement preparedStatement = conn.prepareStatement(sql.toString());

        if (searchTeam!=null){
            preparedStatement.setString(++flag, searchTeam);
        }else if (searchClasses!=null) {
            preparedStatement.setString(++flag, searchClasses);
        }else if (searchkey!=null){ }

        preparedStatement.setInt(++flag, start);
        preparedStatement.setInt(++flag, total);

        System.out.println("Message:\nsql\n"+sql+"\nsearchTeam="+searchTeam+"\nsearchClasses="+searchClasses+"\nsearchkey="+searchkey+"\n"+flag);

        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
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
        request.setAttribute("leaves", leaves);

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
    request.setAttribute("classes",classes);

    process(request,response,"/page/business/export/outputList.jsp");

%>