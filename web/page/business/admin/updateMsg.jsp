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
<!DOCTYPE html>
<html lang="zh-cn">
<body>
<%
    HttpSession sessions = request.getSession();

    User user = (User) sessions.getAttribute("user");

    System.out.println(user);
%>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改个人信息</strong></div>
    <div class="body-content">
        <%
            if (user.getUserType()==3){
        %>
        <form method="post" class="form-x" action="<%=path%>/action/business/admin/action_updateMsg.jsp" target="_parent">
            <div class="clear"></div>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="full_name" value="<%=user!=null?user.getAdmin().getAdminName():""%>"  data-validate="required:姓名不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>手机号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="admin_telephone" value="<%=user!=null?user.getAdmin().getAdminTelephone():""%>"  data-validate="required:手机号不能为空;" />
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
        <%}%>
        <%--辅导员--%>
        <%if (user.getUserType()==2){%>
        <form method="post" class="form-x" action="<%=path%>/action/business/admin/action_updateMsg.jsp" target="_parent">
            <div class="clear"></div>
            <div class="form-group">
                <div class="label">
                    <label>辅导员姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="inst_name" value="<%=user!=null?user.getInstructor().getInstName():""%>"  data-validate="required:姓名不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>辅导员手机号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="inst_telephone" value="<%=user!=null?user.getInstructor().getInstTelephone():""%>"  data-validate="required:手机号不能为空;" />
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
        </form><%
        }
        %>
        <%if (user.getUserType()==1){%>
        <%--学生--%>
        <form method="post" class="form-x" action="<%=path%>/action/business/admin/action_updateMsg.jsp" target="_parent">
            <div class="clear"></div>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_name" value="<%=user!=null?user.getStudent().getStuName():""%>"  data-validate="required:姓名不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="field">
                    <select name="stu_sex" class="input" style="width:60px; line-height:17px;display:inline-block">
                        <option value="0" <%if ("0".equals(user.getStudent().getStuSex())){out.println("selected");}%>>男</option>
                        <option value="1" <%if ("1".equals(user.getStudent().getStuSex())){out.println("selected");}%>>女</option>
                </select>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_address" value="<%=user!=null?user.getStudent().getStuAddress():""%>"  data-validate="required:姓名不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>手机号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_telephone" value="<%=user!=null?user.getStudent().getStuTelephone():""%>"  data-validate="required:手机号不能为空;" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>联系人：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_contact" value="<%=user!=null?user.getStudent().getStuContact():""%>"  data-validate="required:联系人姓名不能为空" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>联系人手机号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="stu_contactTel" value="<%=user!=null&&user.getStudent().getStuTelephone()!=null?user.getStudent().getStuContactTel():""%>"  data-validate="required:联系人手机号不能为空;" />
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
        <%}%>
    </div>
</div>

</body></html>

