<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  program: Leave_sys
  Author: 麦奇
  Email： 1625017540@qq.com
  Date: 5/4/19
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/page/common/base.jsp"%>
<%@ include file="/page/utils/database.jsp"%>
<%
//    实现功能：导出各班级每个学期请假名单

    //获取当前登入辅导员信息
    HttpSession sessions = request.getSession();
    User user = (User) sessions.getAttribute("user");

    //获取查询条件
    String searchTeam = request.getParameter("team");//学期
    String searchClasses = request.getParameter("classes");//班级
    String searchkey = request.getParameter("searchkey");//搜索内容

    //拼接sql
    StringBuilder stringBuilder = new StringBuilder("");

    //执行查询





    //创建工作薄对象
    HSSFWorkbook workbook = new HSSFWorkbook();
    //创建工作表对象
    HSSFSheet sheet = workbook.createSheet("学生请假统计");
    // 创建首行
    HSSFRow cells=sheet.createRow(0);
    cells.createCell(0).setCellValue("编号");
    cells.createCell(1).setCellValue("名字");
    cells.createCell(2).setCellValue("性别");
    cells.createCell(3).setCellValue("地址");
    cells.createCell(4).setCellValue("电话号码");

    // 循环给工作表填充数据
    for (int i = 1; i < 100; i++) {
        // 创建行
        cells = sheet.createRow(i);
        // 创建单元格，然后设置单元格的数据
        cells.createCell(0).setCellValue(i);
        cells.createCell(1).setCellValue("小明");
        cells.createCell(2).setCellValue("男");
        cells.createCell(3).setCellValue("湖南");
        cells.createCell(4).setCellValue("15669855326");
    }
    // 将生成的Excel格式的数据保存到指定的路径中
    workbook.write(new File("E:\\test.xls"));
%>
