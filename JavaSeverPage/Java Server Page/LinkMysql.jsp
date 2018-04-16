<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<body>
<%
Connection con;
Statement sql;
ResultSet rs;
try{Class.forName("com.mysql.jdbc.Driver").newInstance();}
catch(Exception e){out.print(e);}
try{
    String uri="jdbc:mysql://127.0.0.1/td_school";
    con=DriverManager.getConnection(uri,"root","980718");
    sql=con.createStatement();
    rs=sql.executeQuery("SELECT * FROM teacher");
    out.print("<table border=6>");
    out.print("<tr>");
    out.print("<th width=100>"+"id");
    out.print("<th width=100>"+"name");
    out.print("</tr>");
    while(rs.next()){
        out.print("<tr>");
        out.print("<td>"+rs.getString(1)+"</td>");
        out.print("<td>"+rs.getString(2)+"</td>");
        out.print("</tr>");
    }
    out.print("</table>");
    con.close();
}
catch(SQLException e1){out.print(e1);}
%>
</body>
</html>