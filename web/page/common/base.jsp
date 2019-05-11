<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="java.io.IOException"%>
<%@ page import="com.mikey.entity.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%!
	public void process(HttpServletRequest request,HttpServletResponse resp,String url)throws ServletException,IOException{

		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, resp);
	}
	/*
	 * 将时间转换为时间戳
	 */
	public static String dateToStamp(String s) throws ParseException {
		String res;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = simpleDateFormat.parse(s);
		long ts = date.getTime()/1000;
		res = String.valueOf(ts);
		return res;
	}
	/*
	 * 将时间戳转换为时间
	 */
	public static String stampToDate(String s){
		String res;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(Long.parseLong(s));
		res = simpleDateFormat.format(date);
		return res;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<link rel="shortcut icon" href="<%=path%>/images/logo.jpg">
	<link rel="stylesheet" href="<%=path%>/css/pintuer.css">
	<link rel="stylesheet" href="<%=path%>/css/admin.css">
	<script src="<%=path%>/js/jquery.js"></script>
	<script src="<%=path%>/js/pintuer.js"></script>
	<script src="<%=path%>/layui/layui.all.js"></script>
</head>
</html>