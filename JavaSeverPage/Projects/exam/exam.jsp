<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="exam.Randomize"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/exam.css">
<script src="js/jquery-3.2.1.js"></script>
<script src="js/jquery.cookie.js"></script>
</head>

<script>

var time;

function modTime(t) {
	if (t < 10)
		return "0" + t.toString();
	else
		return t.toString();
}

function strTime(t) {
	m = Math.floor(t / 60);
	s = t % 60;
	return modTime(m) + ":" + modTime(s);
}

$(document).ready(function(){
	time = 3600; //parseInt($("#time").val());
	var cookieTime = "showTime";
	if ($.cookie(cookieTime)== "" || $.cookie(cookieTime) == null || isNaN($.cookie(cookieTime))) {
	    $.cookie(cookieTime, time);//系统启动时初始化时间；
	}
	else 
		time = $.cookie(cookieTime);

	$("#showTime").text(strTime(time));
	
	var show = setInterval(function(){
		time = parseInt($.cookie(cookieTime));
		$("#showTime").text(strTime(time));
		if (time == 300)
			alert("距离考试结束还有5分钟，请抓紧答题！");
		if (time <= 300)
			$("#showTime").css("color", "#f00");
		if (time == 0) {
			cleanInterval(show);
			$.cookie(cookieTime, null);
		}
		
		time--;
		
		$.cookie(cookieTime, time);
	}, 1000);
})

</script>


<body>
<div id="container">
    <form id="exam-login" action="score.jsp" method="post">
<%
    String userID = "";

    //userID = (String) session.getAttribute("userID");

    Cookie[] cookie = request.getCookies();
    for (Cookie c : cookie) {
    	if (c.getName().equals("userID"))
    		userID = c.getValue();
    }
    //out.println("<input name=\"userID\" type=\"hidden\" value=\"" + userID + "\">");

    if (userID == "" || userID == null) {
    	out.println("<script>alert(\"请登录后再进行在线测试！\");</script>");
    	out.println("<script>window.location.href(\"login.jsp\");</script>");
    	//response.sendRedirect("login.jsp");
    }
    else {
    	out.println("<div id=\"welcome\">欢迎" + exam.Data.getStr("student", userID, "name") + "使用信息技术在线测试系统V1.0</div>");
    	out.println("<div id=\"showTime\"></div>");
        int num = 10;
        out.println("<input name=\"userID\" type=\"hidden\" value=\"" + userID + "\">");
        int[] list = new int[num];
        list = exam.Randomize.randOnly(1, exam.Data.count("computer"), num);
        list = exam.Randomize.sort(list);
        for (int i = 0; i < num; i++) {
        	out.println("<div class=\"subject\">");
            out.println(i + 1 + ". ");
        	out.println(exam.Pageshow.showSubject("选", list[i]));
        	out.println("</div>");
        }
    }
%>
        <div id="but-submit">提交试卷</div>
    </form>
</div>
</body>
</html>

