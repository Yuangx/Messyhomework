<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/exam.css">
<script src="js/jquery-3.2.1.js"></script>
<script src="js/jquery.cookie.js"></script>
</head>
<body>
<%
	Enumeration e = request.getParameterNames();
	String numName = (String) e.nextElement();
	int num = Integer.parseInt(request.getParameter(numName));
	int score = 0;
	int s = 100 / num;
	
	String userIDName = (String) e.nextElement();
	String userID = request.getParameter(userIDName);
	if (userID == "" || userID == null)
		response.sendRedirect("login.jsp");
	while (e.hasMoreElements()) {
		String thisName = (String) e.nextElement();
		String thisValue = request.getParameter(thisName);
		
		String id = thisName.substring(1);
		String answer = exam.Data.getStr("computer", id, "answer");
		if (answer.equals(thisValue))
			score = score + s;
		}
	    exam.Score.addScore(userID, score);
	    out.println("<script>alert(\"考试已完成，请离开考场！\");</script>");
	    out.println("<script>window.close();</script>");
	%>
</body>
</html>