<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 4/17/19
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="../../images/logo.jpg" class="radius-circle rotate-hover" height="50" alt="" />课堂考勤系统</h1>
    </div>
    <div class="head-l" ><a href="" target="_blank" style="color:#FFF" ><span class="icon-user"></span> 欢迎 admin</a>&nbsp;&nbsp;<a class="button button-little bg-green" href="" target="_blank" ><span class="icon-home"></span> 首页</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="../login.html"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>


    <h2><span class="icon-user"></span>基本设置</h2>
    <ul style="display:block">
        <li><a href="../../admin/addstudent.html" target="right"><span class="icon-caret-right"></span>网站设置</a></li>
        <li><a href="../../pass.html" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
        <li><a href="../../page.html" target="right"><span class="icon-caret-right"></span>单页管理</a></li>
        <li><a href="../../adv.html" target="right"><span class="icon-caret-right"></span>首页轮播</a></li>
        <li><a href="../../book.html" target="right"><span class="icon-caret-right"></span>留言管理</a></li>
        <li><a href="../../column.html" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
    <ul>
        <li><a href="../../list.html" target="right"><span class="icon-caret-right"></span>内容管理</a></li>
        <li><a href="../../add.html" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
        <li><a href="../../cate.html" target="right"><span class="icon-caret-right"></span>分类管理</a></li>
    </ul>
    <h2><span class="icon-user"></span>课堂考勤</h2>
    <ul>
        <li><a href="../../list.html" target="right"><span class="icon-caret-right"></span>添加老师</a></li>
        <li><a href="../../add.html" target="right"><span class="icon-caret-right"></span>查询老师</a></li>
    </ul>
    <h2><span class="icon-user"></span>个人信息</h2>
    <ul>
        <li><a href="../../list.html" target="right"><span class="icon-caret-right"></span>个人信息管理</a></li>
        <li><a href="../../add.html" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
    </ul>
    <h2><span class="icon-user"></span>学生管理</h2>
    <ul>
        <li><a href="../../admin/addstudent.html" target="right"><span class="icon-caret-right"></span>添加学生</a></li>
        <li><a href="../../add.html" target="right"><span class="icon-caret-right"></span>查询学生</a></li>
    </ul>
    <h2><span class="icon-user"></span>老师管理</h2>
    <ul>
        <li><a href="../../list.html" target="right"><span class="icon-caret-right"></span>添加老师</a></li>
        <li><a href="../../add.html" target="right"><span class="icon-caret-right"></span>查询老师</a></li>
    </ul>
    <h2><span class="icon-wrench"></span>班级管理</h2>
    <ul>
        <li><a href="../../list.html" target="right"><span class="icon-caret-right"></span>录入班级</a></li>
        <li><a href="../../add.html" target="right"><span class="icon-caret-right"></span>查询班级</a></li>
    </ul>
    <h2><span class="icon-wrench"></span>课程管理</h2>
    <ul>
        <li><a href="../../list.html" target="right"><span class="icon-caret-right"></span>录入课程</a></li>
        <li><a href="../../add.html" target="right"><span class="icon-caret-right"></span>查询课程</a></li>
    </ul>

</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
    <li><a href="##" id="a_leader_txt">欢迎界面</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</php></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="welcome.html" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
    <p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
</body>
</html>

