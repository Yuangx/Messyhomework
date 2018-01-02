<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="exam.Data"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="css/slist.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>
<% 
    final int num = 10;//每页显示num条信息；
    int intPage;
    if (request.getParameter("page") != "" && request.getParameter("page") != null)
        intPage = Integer.parseInt(request.getParameter("page"));
    else
    	intPage = 0;
    if (intPage < 0)
    	intPage = 0;
    if (intPage >= (Math.ceil(Data.count("computer") / num)) + 1)
    	intPage--;
%>
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
    	rs.absolute(num * intPage);
    	for (int i = 0; i < num; i++) {
    		if (rs.next()) {
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
        	    out.println("<button class=\"btn btn-sm btn-danger\">删除</button>");
        	    out.println("</td>");
        	    out.println("<td class=\"button\">");
        	    out.println("<button class=\"btn btn-sm btn-info\">修改</button>");
        	    out.println("</td>");
        	    out.println("</tr>");
    		}
    	}
    }catch(Exception e) {
    }
%>
    </tbody>
</table>

<div style="padding-top: 20px;">
    <a href="sltest.jsp?page=0">
        <button id="nextPage" class="btn btn-info"><<</button>
    </a>
    
    <a href="sltest.jsp?page=<%
        if (intPage > 0)
            out.println(intPage - 1);
        else
        	out.println(intPage);
        %>">
        <button class="btn btn-info"><</button>
    </a>
    <a href="sltest.jsp?page=<%
        if (intPage <= Math.floor(Data.count("computer") / num) - 1)
            out.println(intPage + 1);
        else
        	out.println(intPage);
    %>">
        <button id="nextPage" class="btn btn-info">></button>
    </a>
    <a href="sltest.jsp?page=<%
        out.println((int) (Math.floor(Data.count("computer") / num)));
    %>">
        <button id="nextPage" class="btn btn-info">>></button>
    </a>
</div>
</body>
<script>

</script>
</html>