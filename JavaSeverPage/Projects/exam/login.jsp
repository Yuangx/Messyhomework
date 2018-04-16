<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.*" %>
<%@ page import="exam.Data"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/jquery-3.2.1.js"></script>
</head>
<%
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");
    if (userID == "" || userID == null) {
        ;
    }
    else {
    
        int exit = Data.count("student", userID);
        if (exit == 1) {
        	String tP = Data.getStr("student", userID, "password");
        	if (tP.equals(userPassword)) {
        		if (Data.count("score", userID) >= 1)
        			out.println("<script>alert(\"请勿重复登录考查！\")</script>");
        		else {
        			//session.setAttribute("userID", userID);
            		//session.setMaxInactiveInterval(70 * 60);
            		Cookie cookie = new Cookie("userID", userID);
            		cookie.setMaxAge(70 * 60);
            		response.addCookie(cookie);
            		response.sendRedirect("exam.jsp");
        		}
        		
        	}
        	else {
        		out.println("<script>alert(\"密码不正确，请重新输入！\")</script>");
        	}
        }
        else
        	out.println("<script>alert(\"no\")</script>");
    }
%>
<body>
    <div id="login">
        <div id="login-border">
        <form id="login-form" action="login.jsp" method="post">
            <div id="login-title">
                <div id="login-title-txt">用户登录</div>
            </div>

            <div class="login-line">
                <div class="login-input-title">
                    <div class="login-input-title-txt">
                        用户账号
                    </div>
                </div>
                <div class="login-input">
                    <input id="userID" name="userID" type="text">
                </div>
            </div>

            <div class="login-line">
                <div class="login-input-title">
                    <div class="login-input-title-txt">
                        登录密码
                    </div>
                </div>
                <div class="login-input">
                    <input id="userPassword" name="userPassword" type="password">
                </div>
            </div>

            <div class="login-line">
                <div id="login-submit">提 交</div>
            </div>
        </form>
        </div>
    </div>
</body>
</html>
<script>
    $( document ).ready( function() {
        $( "#login-submit" ).click( function() {
            $( "#login-form" ).submit();
        } )
    } )
</script>