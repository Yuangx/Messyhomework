<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="../CSS/userpassword.css">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
</head>
<%
    String userName = request.getParameter("userName");
    String userPassword;
    if (userName == "" || userName == null) {
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
        String sql = "select * from student where id = '" + userName + "'";
		statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
        if (rs.next()) {
		    String getPassword = rs.getString("password");
			if (userPassword.equals(getPassword))
			    out.print("<script>alert(\"验证通过！\")</script>");
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
                <div id="login-title-txt">修 改 密 码</div>
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
                    <div class="login-input-title-txt">新 密 码</div>
                </div>
                <div class="login-input">
                    <input id="newPassword" name="newPassword" type="password">
                </div>
            </div>
            <div class="login-line">
                <div class="login-input-title">
                    <div class="login-input-title-txt">确认密码</div>
                </div>
                <div class="login-input">
                    <input id="enterPassword" name="enterPassword" type="password">
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
    function getCheck() {//获取新的四位验证码
        var check = $.ajax( {
            type: "post",
            url: "checkNum.jsp",
            async: false,
        } ).responseText;
        return check;
    }

    function blank() {
        $( "#userPassword" ).val( "" );
        $( "#newPassword" ).val( "" );
        $( "#enterPassword" ).val( "" );
        $( "#login-check-code" ).text( getCheck() );
    }
    $( document ).ready( function() {
        $( "#login-check-code" ).text( getCheck() );
        $( "#userID" ).focus();
        $( "#login-submit" ).click( function() {
            if ( $( "#userID" ).val() == "" ) {
                alert("用户账号为空！");
                $( "#userID" ).focus();
                blank();
            }
            else
                if ( $( "#userPassword" ).val() == "" ) {
                    alert("用户密码为空！");
                    $( "#userPassword" ).focus();
                    blank();
                }
                else
                    if ( $( "#newPassword" ).val() == "" ) {
                        alert("新密码为空！");
                        $( "#userPassword" ).focus();
                        blank();
                    }
                    else
                        if ( $( "#newPassword" ).val().length < 8 ) {
                            alert("新密码长度不能小于8！");
                           $( "#userPassword" ).focus();
                           blank();
                        }
                        else
                            if ( $( "#enterPassword" ).val() == "" ) {
                                alert("二次密码为空！");
                                $( "#userPassword" ).focus();
                                blank();
                            }
                            else
                                if ( $( "#newPassword" ).val() != $( "#enterPassword" ).val() ) {
                                    alert( "两次输入密码不一致！" );
                                    $( "#userPassword" ).focus();
                                    blank();
                                }
                                else {
                                    if ( $( "#userCheck" ).val().toUpperCase() != $( "#login-check-code" ).text().toUpperCase() ) {
                                        alert( "验证码不正确！" );
                                    }
                                }
        } )
    } )
</script>