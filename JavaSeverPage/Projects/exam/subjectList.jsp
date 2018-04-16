<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="uft-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/subjectlist.css">
</head>
<body>
	<table>
		<thead>
			<tr>
				<th class="id">id</th>
				<th class="type">type</th>
				<th class="question">question</th>
				<th class="A">A</th>
				<th class="B">B</th>
				<th class="C">C</th>
				<th class="D">D</th>
				<th class="answer">answer</th>
				<th class="delete">delete</th>
				<th class="update">update</th>
			</tr>
		</thead>
		<tbody>
<%
int pageNum = 10;//每页列表数
int count = exam.Data.count("computer");//总元组数
int cPage = (int)(Math.ceil(count / pageNum));//总页数
int nowPage = 0;
if (request.getParameter("page") == "" || request.getParameter("page") == null )
	nowPage = 0;
else
	nowPage = (int)Integer.parseInt(request.getParameter("page"));


String url = "jdbc:mysql://127.0.0.1/test?useUnicode=true&characterEncoding=utf-8&useSSL=false";
String jdbc = "com.mysql.jdbc.Driver";
String dUser = "root";
String dPassword = "";
Connection conn = null;
PreparedStatement statement = null;
try {
	Class.forName(jdbc);
	conn = DriverManager.getConnection(url, dUser, dPassword);// 建立数据库连接
	String sql = "select * from computer order by id";
	statement = conn.prepareStatement(sql);
	ResultSet rs = statement.executeQuery();
	rs.absolute(nowPage * pageNum);
    for(int i = 0; i < 10; i++) {
    	if(rs.next()) {
    		out.println("<tr>");
    		//id
    		out.println("<td class=\"id\">");
    		out.println(rs.getString("id"));
    		out.println("</td>");
    		//type
    		out.println("<td class=\"type\">");
    		out.println(rs.getString("type"));
    		out.println("</td>");
    		//question
    		out.println("<td class=\"question\">");
    		out.println("<div class=\"showText\">");
    		out.println(rs.getString("question"));
    		out.println("</div>");
    		out.println("</td>");
    		//A
    		out.println("<td class=\"A\">");
    		out.println("<div class=\"showText\">");
    		out.println(rs.getString("A"));
    		out.println("</div>");
    		out.println("</td>");
    		//B
    		out.println("<td class=\"B\">");
    		out.println("<div class=\"showText\">");
    		out.println(rs.getString("B"));
    		out.println("</div>");
    		out.println("</td>");
    		//C
    		out.println("<td class=\"C\">");
    		out.println("<div class=\"showText\">");
    		out.println(rs.getString("C"));
    		out.println("</div>");
    		out.println("</td>");
    		//D
    		out.println("<td class=\"D\">");
    		out.println("<div class=\"showText\">");
    		out.println(rs.getString("D"));
    		out.println("</div>");
    		out.println("</td>");
    		//answer
    		out.println("<td class=\"answer\">");
    		out.println(rs.getString("answer"));
    		out.println("</td>");
    		//delete
    		out.println("<td class=\"delete\">");
    		out.println("<input type=\"button\" value=\"删除\">");
    		out.println("</td>");
    		//update
    		out.println("<td class=\"delete\">");
    		out.println("<input type=\"button\" value=\"更新\">");
    		out.println("</td>");
    		out.println("</tr>");
    	}
	}
}catch(Exception e) {
	
}

%>
		</tbody>
	</table>
	<div class="container">
	    <a href="subjectList.jsp?page=0"><input type="button" value="<<"></a>
	    <a href="subjectList.jsp?page=<%=nowPage-1%>"><input type="button" value="<"></a>
	    <a href="subjectList.jsp?page=<%=nowPage+1%>"><input type="button" value=">"></a>
	    <a href="subjectList.jsp?page=0"><input type="button" value=">>"></a>
	</div>
</body>
</html>