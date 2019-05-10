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
    String student_id = request.getParameter("student_id");

    Student student = null;

    Connection conn = getConn();
    HttpSession sessions = request.getSession();

    User instructor = (User) sessions.getAttribute("user");
    List<Classes> classes = classes  = new ArrayList<Classes>();

    if (student_id!=null&&student_id!="") {

        String sql = "select * from sys_student where stu_id = ?";

        PreparedStatement preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1, student_id);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
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
        }
        close(preparedStatement,resultSet);
    }
        String sql_class = "select * from sys_classes,sys_department where sys_department.dep_id = sys_classes.dep_id and sys_department.dep_id =?";

        PreparedStatement preparedStatement_class = conn.prepareStatement(sql_class);

        preparedStatement_class.setString(1,instructor.getInstructor().getDepId());
        ResultSet resultSetClass = preparedStatement_class.executeQuery();

        while (resultSetClass.next()){

            Classes classe = new Classes();

            classe.setClassId(resultSetClass.getString("class_id"));
            classe.setClassName(resultSetClass.getString("class_name"));
            classe.setDepId(resultSetClass.getString("dep_id"));
            classe.setClassMajor(resultSetClass.getString("class_major"));
            classe.setClassGrade(resultSetClass.getString("class_grade"));

            classes.add(classe);
        }
        System.out.println(classes);

        close(resultSetClass,preparedStatement_class,conn);


%>
<!DOCTYPE html>
<html lang="zh-cn">
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改个人信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="<%=path%>/action/business/student/<%=student_id!=null?"action_updateStudent.jsp":"action_addStudent.jsp"%>">
            <div class="clear"></div>
            <%--课程编号、所属班级、课程名称、年级、专业--%>
            <div class="form-group">
                <div class="label">
                    <label>学生编号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_id" <%if (student!=null){out.print("readonly='readonly'");}%> value="<%=student!=null?student.getStuId():""%>"  data-validate="required:学生编号不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>学生姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_name"  value="<%=student!=null?student.getStuName():""%>"  data-validate="required:学生姓名不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>所属班级：</label>
                </div>
                <div class="field">
                    <%--<input type="text" class="input w50" name="class_id"  value="<%=student!=null?student.getClassId():""%>"  data-validate="required:所属班级不能为空" />--%>
                        <select name="class_id" class="input w50">
                            <%
                                for (Classes classe:classes) {
                            %>
                            <option <%if (student!=null&&student.getClassId().equals(classe.getClassId())){%>
                                    selected="selected"
                                    <%
                                        }
                                    %>
                                    value="<%=classe.getClassId()%>"><%=classe.getClassName()%></option>
                            <%
                                }
                            %>
                        </select>
                        <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="field">
                    <%--<input type="text" class="input w50" name="stu_sex"  value="<%=student!=null?student.getStuSex():""%>"  data-validate="required:性别不能为空" />--%>
                        <select name="stu_sex" class="input w50">
                            <option value="0" <%if (student!=null&&"0".equals(student.getStuSex())){%> selected="selected"<%}%>>男</option>
                            <option value="1" <%if (student!=null&&"1".equals(student.getStuSex())){%> selected="selected"<%}%>>女</option>
                        </select>
                        <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>住址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_address" value="<%=student!=null?student.getStuAddress():""%>"  data-validate="required:住址不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>联系电话：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_telephone"  value="<%=student!=null?student.getStuTelephone():""%>"  data-validate="required:联系电话不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>联系人：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_contact" value="<%=student!=null?student.getStuContact():""%>"  data-validate="required:联系人不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>联系人电话：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_contactTel" value="<%=student!=null?student.getStuContactTel():""%>"  data-validate="required:联系人电话不能为空;" />
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

