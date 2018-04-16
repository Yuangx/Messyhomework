<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/vote.css">
</head>
<body>
<%
String url = "jdbc:mysql://127.0.0.1/test?useUnicode=true&characterEncoding=utf-8&useSSL=false";
String jdbc = "com.mysql.jdbc.Driver";
String dUser = "root";
String dPassword = "";
Connection conn = null;
PreparedStatement statement = null;

int a = 0;
int b = 0;
int c = 0;

try {
	Class.forName(jdbc);// 建立数据库连接
	conn = DriverManager.getConnection(url, dUser, dPassword);
	String sql;
	String sel = request.getParameter("sel");
	if (sel != "" || sel != null) {
		sql = "update vote set " + sel + "=" + sel + "+1";
		statement = conn.prepareStatement(sql);
		statement.executeUpdate();
		statement.close();
	}
	out.println("<script>alert(\"2\")</script>");
	sql = "select * from vote";
	statement = conn.prepareStatement(sql);
	ResultSet rs = statement.executeQuery();
	if (rs.next()) {
		
		a = rs.getInt("a");
	    b = rs.getInt("b");
	    c = rs.getInt("c");
	}
} catch (Exception e) {
	out.println("<script>alert(\"" + a + "\")</script>");
}
    //out.println("<script>alert(\"" + a + "\")</script>");
    if (a + b + c != 0) {
    	int max = a > b ? a : b;
        max = max > c ? max : c;
        a = (int) (a * 200 / max);
        b = (int) (b * 200 / max);
        c = (int) (c * 200 / max);
    }
%>


<script>
    function c() {
    	document.getElementById("vote-form").submit();
    }
</script>
<div id="vote">
    <div class="vote-sector">
    
        <div id="vote-show">
            <div class="vote-block" style="background:#0f0; height: <%=a%>px; margin-top: <%=(210-a)%>px"></div>
            <div class="vote-block" style="background:#ff0; height: <%=b%>px; margin-top: <%=(210-b)%>px"></div>
            <div class="vote-block" style="background:#f00; height: <%=c%>px; margin-top: <%=(210-c)%>px"></div>
        </div>
    
        <hr>
        <form id="vote-form" action="vote.jsp" method="post">
            <input name="sel" type="radio" value="a"><label>同意</label>
            <input name="sel" type="radio" value="b"><label>弃权</label>
            <input name="sel" type="radio" value="c"><label>反对</label>
            <div id="vote-submit" onclick="c()">确 定</div>
        </form>
    </div>
</div>

</body>
</html>