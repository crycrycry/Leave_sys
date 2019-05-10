<%--Created by IntelliJ IDEA.
program: Leave_sys
Author: 麦奇
Email： 1625017540@qq.com
Date: 5/4/19
Time: 9:01 AM
To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.BufferedOutputStream" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<%@ include file="/page/utils/database.jsp"%>
<%--<%@ include file="action_getLeaves.jsp"%>--%>
<%
//  实现功能：导出各班级每个学期请假名单
    //获取当前登入辅导员信息
    HttpSession sessions = request.getSession();
    User user = (User) sessions.getAttribute("user");
    //获取查询条件
    String searchTeam = request.getParameter("team");//学期
    String searchClasses = request.getParameter("classes");//班级
    String searchkey = request.getParameter("searchkey");//搜索内容
    //执行查询
    List<Leave> leaves = new ArrayList<Leave>();

    Connection conn = getConn();

    int flag = 0;
    //查询假条
    StringBuilder sql = new StringBuilder("select * from sys_leave sl,sys_student ss,sys_course sc,sys_classes scl " +
            "  where sl.stu_id=ss.stu_id " +
            "  and sl.course_id = sc.course_id " +
            "  and sc.class_id = scl.class_id " +
            "  and dep_id = ? " +
            "  and sc.course_term = ? " +
            "  and scl.class_id = ? ");
    PreparedStatement preparedStatement = conn.prepareStatement(sql.toString());

    preparedStatement.setString(1,user.getInstructor().getDepId());
    preparedStatement.setString(2, searchTeam);
    preparedStatement.setString(3, searchClasses);

    System.out.println("导出=Message:\n"+user.getInstructor().getDepId()+sql+"\nsearchTeam="+searchTeam+"\nsearchClasses="+searchClasses+"\nsearchkey="+searchkey+"\n"+flag);

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
//    List<Leave> leaves = getLeaves(searchTeam, searchClasses, searchkey);//请假数据
    //创建工作薄对象
    HSSFWorkbook workbook = new HSSFWorkbook();
    //创建工作表对象
    HSSFSheet sheet = workbook.createSheet("学生请假统计");
    // 创建首行
    HSSFRow cells=sheet.createRow(0);
    cells.createCell(0).setCellValue("序号");
    cells.createCell(1).setCellValue("学生名字");
    cells.createCell(2).setCellValue("请假课程");
    cells.createCell(3).setCellValue("请假事由");
    cells.createCell(4).setCellValue("请假天数");
    cells.createCell(5).setCellValue("请假时间");
    cells.createCell(6).setCellValue("审核时间");
    cells.createCell(7).setCellValue("审核意见");
    // 循环给工作表填充数据
    int i=0;
    for (Leave leave:leaves) {
        // 创建行
        cells = sheet.createRow(++i);
        // 创建单元格，然后设置单元格的数据
        cells.createCell(0).setCellValue(i);
        cells.createCell(1).setCellValue(leave.getStudent().getStuName());
        cells.createCell(2).setCellValue(leave.getCourse().getCourseName());
        cells.createCell(3).setCellValue(leave.getLeaveReason());
        cells.createCell(4).setCellValue(leave.getLeaveDaynum());
        cells.createCell(5).setCellValue(leave.getLeaveApplytime());
        cells.createCell(6).setCellValue(leave.getLeaveAudittime());
        cells.createCell(7).setCellValue(leave.getLeaveOpinion());
    }
    // 将生成的Excel格式的数据保存到指定的路径中
    workbook.write(new File("/home/mikey/Documents/test.xls"));

    // setHeader设置打开方式，具体为：inline为在浏览器中打开，attachment单独打开
    response.setHeader("Content-disposition","inline;filename=\"" + "学生请假统计.xlsx".toString().getBytes("utf-8") + "\";");

    BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(response.getOutputStream());

    workbook.write(bufferedOutputStream);

    response.setContentType("application/vnd.ms-excel;charset=utf-8");

    bufferedOutputStream.flush();

    bufferedOutputStream.close();
%>
