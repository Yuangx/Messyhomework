<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote online</title>
<script src="js/jquery-3.2.1.js"></script>
<style>
#vote {
    width: 280px;
    height: 311px;
    border: 1px #333 solid;
    background: #efefef;
}
#vote-elem {
    padding-top: 20px;
    width: 100%;
    height: 200px;
    background: #666;
    border-bottom: 1px #333 solid;
}
#vote-form-div {
    padding-top: 15px;
    height: 35px;
}
input[type="radio"] {
    margin-left: 30px;
}
.vote-block {
    float: left;
    margin-left: 40px;
    width: 40px;
    height: 200px;
    
}
#vote-a { background: #0f0; }
#vote-b { background: #999; }
#vote-c { background: #f00; }
#vote-submit {
    padding: 10px 0;
    width: 100%;
    height: 20px;
    color: #fff;
    font-size: 20px;
    text-align: center;
    background: #444;
    cursor: default;
}
</style>
</head>
<body>
<%
    int a = 0;
    int b = 0; 
    int c = 0;
    String url = "jdbc:mysql://127.0.0.1/test?useUnicode=true&characterEncoding=utf-8&useSSL=false";
    String jdbc = "com.mysql.jdbc.Driver";
    String dUser = "root";
    String dPassword = "";
    Connection conn = null;
    PreparedStatement statement = null;
    try {
    	Class.forName(jdbc);// 建立数据库连接
		conn = DriverManager.getConnection(url, dUser, dPassword);
    	String sql = "select * from vote where id='000001'";
    	statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			a = rs.getInt("a");
			b = rs.getInt("b");
			c = rs.getInt("c");
		}
		int max = a > b ? a : b;
		max = max > c ? max : c;
		a = a * 200 / max;
		b = b * 200 / max;
		c = c * 200 / max;
    }catch(Exception e) {
    	
    }
%>
<div id="vote">
    <div id="vote-elem">
        <div id="vote-a" class="vote-block" style="height: <%=a%>px; margin-top: <%=(200-a)%>px;"></div>
        <div id="vote-b" class="vote-block" style="height: <%=b%>px; margin-top: <%=(200-b)%>px;"></div>
        <div id="vote-c" class="vote-block" style="height: <%=c%>px; margin-top: <%=(200-c)%>px;"></div>
    </div>
    <div id="vote-form-div">
        <form id="vote-form" action="vot.jsp" method="post">
            <input name="selRadio" type="radio"><label>同意</label>
            <input name="selRadio" type="radio"><label>弃权</label>
            <input name="selRadio" type="radio"><label>反对</label>
        </form>
    </div>
    <div id="vote-submit">提 交</div>
</div>
</body>
<script>
    $(document).ready(function() {
    	$("#vote-submit").click(function() {
    		$("#vote-form").submit();
    	})
    })
</script>
</html>