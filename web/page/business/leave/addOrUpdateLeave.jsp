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
    String course_id = request.getParameter("course_id");

    Course course = null;

    if (course_id!=null&&course_id!=""){

        Connection conn = getConn();

        String sql = "select * from sys_course where course_id = ?";

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1,course_id);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()){
            course = new Course();
            course.setCourseId(resultSet.getString("course_id"));
            course.setClassId(resultSet.getString("class_id"));
            course.setCourseName(resultSet.getString("course_name"));
            course.setCourseYear(resultSet.getString("course_year"));
            course.setCourseTerm(resultSet.getString("course_term"));
            course.setCourseHour(resultSet.getInt("course_hour"));
            course.setCourseMajor(resultSet.getString("course_major"));
            course.setCourseGrade(resultSet.getString("course_grade"));
        }
    }

%>
<!DOCTYPE html>
<html lang="zh-cn">
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改个人信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="<%=path%>/action/business/course/<%=course_id!=null?"action_updateCourse.jsp":"action_addCourse.jsp"%>">
            <div class="clear"></div>
            <%--课程编号、所属班级、课程名称、年级、专业--%>
            <div class="form-group">
                <div class="label">
                    <label>课程编号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="course_id" <%if (course!=null){out.print("readonly='readonly'");}%> value="<%=course!=null?course.getCourseId():""%>"  data-validate="required:课程编号不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>课程名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="course_name"  value="<%=course!=null?course.getCourseName():""%>"  data-validate="required:课程名称不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>所属班级：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="class_id"  value="<%=course!=null?course.getClassId():""%>"  data-validate="required:所属班级不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>所属专业：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="course_major"  value="<%=course!=null?course.getCourseMajor():""%>"  data-validate="required:所属专业不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>所在年级：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="course_grade" value="<%=course!=null?course.getCourseGrade():""%>"  data-validate="required:所属年级不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>学年：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="course_year"  value="<%=course!=null?course.getCourseYear():""%>"  data-validate="required:学年不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>学期：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="course_term" value="<%=course!=null?course.getCourseTerm():""%>"  data-validate="required:学期不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>学时：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="course_hour" value="<%=course!=null?course.getCourseHour():""%>"  data-validate="required:学时不能为空;" />
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

</body></html>

