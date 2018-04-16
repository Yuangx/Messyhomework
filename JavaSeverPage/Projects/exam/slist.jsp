<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="exam.Data"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="css/slist.css">
    <script src="js/jquery-3.2.1.js"></script>
</head>
<body>
<table>
    <thead>
        <tr>
            <th class="id">题号</th>
            <th class="type">题型</th>
            <th class="question">题目</th>
            <th class="A">A</th>
            <th class="B">B</th>
            <th class="C">C</th>
            <th class="D">D</th>
            <th class="answer">答案</th>
            <th class="button">删除</th>
            <th class="button">修改</th>
        </tr>
    </thead>
    <tbody>
 <%
    String url = "jdbc:mysql://127.0.0.1/test?useUnicode=true&characterEncoding=utf-8&useSSL=false";
    String jdbc = "com.mysql.jdbc.Driver";
    String dUser = "root";
    String dPassword = "";
    Connection conn = null;
    PreparedStatement statement = null;
    try {
    	Class.forName(jdbc);// 建立数据库连接
    	conn = DriverManager.getConnection(url, dUser, dPassword);
    	String sql = "select * from computer order by id";
    	statement = conn.prepareStatement(sql);
    	ResultSet rs = statement.executeQuery();
    	while (rs.next()) {
    		out.println("<tr>");
    		out.println("<td class=\"id\">");
    	    out.println(rs.getString("id"));
    	    out.println("</td>");
    	    out.println("<td class=\"type\">");
    	    out.println(rs.getString("type"));
    	    out.println("</td>");
    	    out.println("<td class=\"question\">");
    	    out.println("<div>");
    	    out.println(rs.getString("question"));
    	    out.println("</div>");
    	    out.println("</td>");
    	    out.println("<td class=\"A\">");
    	    out.println("<div>");
    	    out.println(rs.getString("A"));
    	    out.println("</div>");
    	    out.println("</td>");
    	    out.println("<td class=\"B\">");
    	    out.println("<div>");
    	    out.println(rs.getString("B"));
    	    out.println("</div>");
    	    out.println("</td>");
    	    out.println("<td class=\"C\">");
    	    out.println("<div>");
    	    out.println(rs.getString("C"));
    	    out.println("</div>");
    	    out.println("</td>");
    	    out.println("<td class=\"D\">");
    	    out.println("<div>");
    	    out.println(rs.getString("D"));
    	    out.println("</div>");
    	    out.println("</td>");
    	    out.println("<td class=\"answer\">");
    	    out.println(rs.getString("answer"));
    	    out.println("</td>");
    	    out.println("<td class=\"button\">");
    	    out.println("<input type=\"button\" value=\"删除\">");
    	    out.println("</td>");
    	    out.println("<td class=\"button\">");
    	    out.println("<input type=\"button\" value=\"修改\">");
    	    out.println("</td>");
    	    out.println("</tr>");
    	}
    }catch(Exception e) {  	
    }

%>   
    </tbody>
</table>
</body>
</html>