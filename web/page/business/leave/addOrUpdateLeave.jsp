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
    //修改 添加
    String leave_id = request.getParameter("leave_id");

    Leave leave = null;

    Connection conn = getConn();

    if (leave_id!=null&&leave_id!=""){

        String sql = "select * from sys_leave where leave_id = ?";

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1,leave_id);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()){
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

            System.out.println(leave);
        }
    }

    //查询课程
    List<Course> courses = new ArrayList<Course>();

    Course course = null;

    String sql = "select * from sys_course ";

    PreparedStatement preparedStatement = conn.prepareStatement(sql);

    ResultSet resultSet = preparedStatement.executeQuery();

    while (resultSet.next()){

        course = new Course();

        course.setCourseId(resultSet.getString("course_id"));
        course.setClassId(resultSet.getString("class_id"));
        course.setCourseName(resultSet.getString("course_name"));
        course.setCourseYear(resultSet.getString("course_year"));
        course.setCourseTerm(resultSet.getString("course_term"));
        course.setCourseHour(resultSet.getInt("course_hour"));
        course.setCourseMajor(resultSet.getString("course_major"));
        course.setCourseGrade(resultSet.getString("course_grade"));

        courses.add(course);
    }

    close(resultSet,preparedStatement,conn);
%>
<!DOCTYPE html>
<html lang="zh-cn">
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改假条信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="<%=path%>/action/business/leave/<%=leave_id!=null?"action_updateLeave.jsp":"action_addLeave.jsp"%>">
            <div class="clear"></div>
            <%
                if (leave!=null){
            %>
            <div class="form-group">
                <div class="label">
                    <label>ID：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="leave_id" readonly="readonly"   value="<%=leave.getLeaveId()%>"/>
                </div>
            </div>
            <%
                }
            %>
            <div class="form-group">
                <div class="label">
                    <label>请假课程：</label>
                </div>
                <div class="field">
                    <select name="course_id" class="input w50">
                        <%
                            for (Course cours:courses) {
                        %>
                        <option <%if (leave!=null&&leave.getCourseId().equals(cours.getCourseId())){%>
                                selected="selected"
                                <%
                                    }
                                %>
                                value="<%=cours.getCourseId()%>"><%=cours.getCourseName()%></option>
                        <%
                            }
                        %>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
            <div class="label">
                <label>请假事由：</label>
            </div>
            <div class="field">
                <textarea type="text" class="input w50" name="leave_reason" style="height:150px;" placeholder="请输入请假事由"  data-validate="required:请假事由不能为空">
                    <%
                      if (leave!=null){
                          out.print(leave.getLeaveReason());
                      }
                    %>
                </textarea>
                <div class="tips"></div>
            </div>
        </div>

            <div class="form-group">
                <div class="label">
                    <label>请假天数：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="leave_dayNum"   value="<%=leave!=null?leave.getLeaveDaynum():""%>"  data-validate="required:请假天数不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>请假时间：</label>
                </div>
                <div class="field">
                    <input id="date_info" type="date" class="input w50" name="leave_applyTime" pattern="yyyy-MM-dd" value="<%=leave!=null?leave.getLeaveApplytime():""%>"  data-validate="required:请假时间不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        var time = new Date();
        var day = ("0" + time.getDate()).slice(-2);
        var month = ("0" + (time.getMonth() + 1)).slice(-2);
        var today = time.getFullYear() + "-" + (month) + "-" + (day);
        $('#date_info').val(today);
    })

</script>
</body></html>

