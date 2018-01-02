<%@ page contentType="text/html;charset=UTF-8" language ="java" errorPage ="error.html"%>
<html>
<head></head>
<body>
<%
for(int i=0;i<6;i++){
    out.print("<h"+(i+1)+">");
    out.print("hello world");
    out.print("</h>");
}
%>
</body>
</html>
<script language="javascript">

</script>