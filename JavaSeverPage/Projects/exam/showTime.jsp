<%@ page import="exam.Data"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{    
    text-align: center;
    font-size: 20px;
}
</style>
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
    	time = parseInt($("#time").val());
    	var cookieTime = "showTime";
    	if ($.cookie(cookieTime)== "" || $.cookie(cookieTime) == null)
    	    $.cookie(cookieTime, time);//系统启动时初始化时间；
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
<input id="time" type="hidden" value="
<%
    out.print(Data.getInt("ref", "time"));
%>
">
<div>距离考试结束还剩：<font id="showTime"></font></div>
</body>
</html>