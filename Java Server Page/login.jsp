<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="../CSS/login.css">
    <script src="js/jquery-3.2.1.js"></script>
</head>
<%
    String userID = request.getParameter("userID");
    String userPassword;
    if (userID == "" || userID == null) {
        ;
    }
    else {
        userPassword = request.getParameter("userPassword");
        String url = "jdbc:mysql://127.0.0.1/test?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		String jdbc = "com.mysql.jdbc.Driver";
		String dUser = "root";
		String dPassword = "980718";
        Connection conn = null;
		PreparedStatement statement = null;
		Class.forName(jdbc);// 建立数据库连接
		conn = DriverManager.getConnection(url, dUser, dPassword);
        String sql = "select * from student where id = '" + userID + "'";
		statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
        if (rs.next()) {
		    String getPassword = rs.getString("password");
			if (userPassword.equals(getPassword)) {
			    out.print("<script>alert(\"验证通过！\")</script>");
			    session.setAttribute("userID", userID);
			    session.setAttribute("name", rs.getString("name"));
                session.setMaxInactiveInterval(20 * 60);
                out.print("<script>window.location.href(\"t5007.jsp\");</script>");
                //response.sendRedirect("t5007.jsp");
            }
			else
			    out.print("<script>alert(\"用户密码不正确，请重新输入！\")</script>");
	    }
		else
			out.print("<script>alert(\"用户ID不存在，请重新输入！\")</script>");
    }
%>
<body>
    <div id="login">
        <div id="login-border">
        <form id="login-form" action="login.jsp" method="post">
            <div id="login-title">
                <div id="login-title-txt">用 户 登 录</div>
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
                <div class="login-input-title">
                    <div class="login-input-title-txt">
                        验 证 码
                    </div>
                </div>
                <div class="login-input" id="login-check-input">
                    <input id="userCheck" type="text" maxlength="4">
                </div>
                <div id="login-check-code"></div>
                <div id="login-check-new">看不清</div>
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