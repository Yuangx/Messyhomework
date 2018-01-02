<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>vote online</title>
<script src="js/jquery-3.2.1.js"></script>
<style>
    #vote {
        width: 280px;
        height: 330px;
        border: 1px #333 solid;
        background: #efefef;
    }
    #vote-show {
        clear: both;
        padding-top: 50px;
        width: 280px;
        height: 201px;
    }
    .vote-block { 
        float: left;
        margin-left: 40px;
        width: 40px;
        border: 1px #333 solid;
        border-bottom: 0;
    }
    #a { background: #0f0; }
    #b { background: #ff0; }
    #c { background: #f00; }
    hr { margin: 0; }
    #vote-formDiv { padding-top: 10px; }
    input[type="radio"] {
        margin-left: 30px;
    }
    #vote-submit {
        margin-top: 10px;
        padding: 10px 0;
      
        width: 100%;
        height: 20px;
        color: #fff;
        text-align: center;
        background: #333;
        cursor: pointer;
    }
</style>

</head>

<body>

<%
    int a = 0;
    int b = 0;
    int c = 0;
    int max = 0;
    String url = "jdbc:mysql://127.0.0.1/test?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	String jdbc = "com.mysql.jdbc.Driver";
	String dUser = "root";
	String dPassword = "";
	Connection conn = null;
	PreparedStatement statement = null;

	try {
		Class.forName(jdbc);// 建立数据库连接
		conn = DriverManager.getConnection(url, dUser, dPassword);
		String sql;
		if (request.getParameter("sel") != "" || request.getParameter("sel") != null) {
			sql = "update vote set " + request.getParameter("sel") + "=" + request.getParameter("sel") + "+1";
			statement = conn.prepareStatement(sql);
			statement.executeUpdate();
		}
		
		
		sql = "select * from vote";
		statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			a = rs.getInt("a");
			b = rs.getInt("b");
			c = rs.getInt("c");
		}
		if (a + b + c != 0) {
			max = a > b ? a : b;
			max = max > c ? max : c;
			a = a * 200 / max;
			b = b * 200 / max;
			c = c * 200 / max;
		}
		
	}catch(Exception e) {
		
	}
%>
<div id="vote">
    <div id="vote-show">
        <div class="vote-block" id="a" style="height: <%=a%>px; margin-top: <%=(200-a)%>px;"></div>
        <div class="vote-block" id="b" style="height: <%=b%>px; margin-top: <%=(200-b)%>px;"></div>
        <div class="vote-block" id="c" style="height: <%=c%>px; margin-top: <%=(200-c)%>px;"></div>
    </div>
    <hr>
    <div id="vote-formDiv">
        <form id="vote-form" action="voter.jsp" method="post">
            <input name="sel" type="radio" value="a"><label>同意</label>
            <input name="sel" type="radio" value="b"><label>弃权</label>
            <input name="sel" type="radio" value="c"><label>反对</label>
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